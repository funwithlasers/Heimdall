using DataAccess.DbAccess;
using DataAccess.Models;

namespace DataAccess.Data;

public class TodoItemData : ITodoItemData
{
    private readonly ISqlDataAccess _db;

    public TodoItemData(ISqlDataAccess db)
    {
        _db = db;
    }

    public async Task<IEnumerable<TodoItemModel>> GetTodoItemsByUser(int id)
    {
        var results = await _db.LoadData<TodoItemModel, dynamic>(
            "dbo.spTodoItem_GetByUser",
            new { UserId = id });
        return results;
    }

    public Task InsertTodoItem(TodoItemModel todoItem) =>
        _db.SaveData("dbo.spTodoItem_Insert", 
            new { todoItem.DueDate, todoItem.Title, todoItem.Status, todoItem.UserId });

    public Task UpdateTodoItem(TodoItemModel todoItem) =>
        _db.SaveData("dbo.spTodoItem_Update", todoItem);

    public Task DeleteTodoItem(int id) =>
        _db.SaveData("dbo.spTodoItem_Delete", new { TodoItemId = id });
}
