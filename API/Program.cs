using DataAccess.DbAccess;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.IdentityModel.JsonWebTokens;
using Microsoft.IdentityModel.Protocols.OpenIdConnect;
using Microsoft.IdentityModel.Tokens;
using System.Security.Claims;
using System.Security.Cryptography;
using TodoCalendarApi;

var builder = WebApplication.CreateBuilder(args);

var rsaKey = RSA.Create();

rsaKey.ImportRSAPrivateKey(File.ReadAllBytes("key"), out _);

builder.Services.AddAuthentication("jwt")
    .AddJwtBearer("jwt", options =>
    {
        options.TokenValidationParameters = new TokenValidationParameters()
        {
            ValidateAudience = false,
            ValidateIssuer = false
        };

        options.Events = new JwtBearerEvents()
        {
            OnMessageReceived = (context) =>
            {
                if (context.Request.Query.ContainsKey("t"))
                {
                    context.Token = context.Request.Query["t"];
                }

                return Task.CompletedTask;
            }
        };

        //TODO: 
        //options.ConfigurationManager

        options.Configuration = new OpenIdConnectConfiguration()
        {
            SigningKeys =
            {
                new RsaSecurityKey(rsaKey)
            }
        };

        //Do not let .NET do its weird claims mapping
        options.MapInboundClaims = false;
    });

builder.Services.AddAuthorization();

var MyAllowSpecificOrigins = "_myAllowSpecificOrigins";
builder.Services.AddCors(options =>
{
    options.AddPolicy(MyAllowSpecificOrigins, policy =>
    {
        policy.AllowAnyOrigin()
               .AllowAnyMethod()
               .AllowAnyHeader();
    });
});

builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddSingleton<ISqlDataAccess, SqlDataAccess>();
builder.Services.AddSingleton<IUserData, UserData>();

var app = builder.Build();

if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseCors(MyAllowSpecificOrigins);

app.UseHttpsRedirection();

app.ConfigureApi();

app.MapGet("/", (HttpContext context) =>
{
    var user = context.User.FindFirst("id")?.Value ?? "empty";
    context.Response.WriteAsync(user);
});

app.MapGet("/user", (ClaimsPrincipal user) => user.Claims.ToDictionary(x => x.Type, x => x.Value));

app.MapGet("/secret", [Authorize] () => "you are logged in!");

app.MapGet("/login", () =>
{
    var handler = new JsonWebTokenHandler();
    var key = new RsaSecurityKey(rsaKey);
    var token = handler.CreateToken(new SecurityTokenDescriptor()
    {
        Issuer = "https://localhost:5000",
        Subject = new ClaimsIdentity(
            [
                new Claim("id", Guid.NewGuid().ToString()),
                new Claim("name", "Matt"),
            ]),
        SigningCredentials = new SigningCredentials(key, SecurityAlgorithms.RsaSha256)
    });

    return token;
});

// public jwk key
app.MapGet("/jwk", () =>
{
    var pulbicKey = RSA.Create();
    pulbicKey.ImportRSAPublicKey(rsaKey.ExportRSAPublicKey(), out _);
    var key = new RsaSecurityKey(pulbicKey);
    return JsonWebKeyConverter.ConvertFromRSASecurityKey(key);
});

app.Run();
