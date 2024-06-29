using DataAccess.DbAccess;
using System.Security.Claims;
using TodoCalendarApi;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddAuthentication()
    .AddCookie("auth_scheme");

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

// Add services to the container.
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddSingleton<ISqlDataAccess, SqlDataAccess>();
builder.Services.AddSingleton<IUserData, UserData>();
builder.Services.AddSingleton<ITodoItemData, TodoItemData>();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseCors(MyAllowSpecificOrigins);

app.UseHttpsRedirection();

app.ConfigureApi();

app.MapGet("/user", (ClaimsPrincipal user) => user.Claims.ToDictionary(x => x.Type, x => x.Value));

app.MapGet("/secret", () => "you are logged in!").RequireAuthorization();


app.MapGet("/login", () => Results.SignIn(
    new ClaimsPrincipal(
        new ClaimsIdentity(
            new[]
            {
                new Claim("id", "1"),
                new Claim("name", "matt")
            },
            "auth_scheme"
        )
    ),
    authenticationScheme: "auth_scheme"
));

app.Run();
