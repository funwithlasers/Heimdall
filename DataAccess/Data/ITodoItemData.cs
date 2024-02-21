using DataAccess.Models;

namespace DataAccess.Data;

public interface ITodoItemData
{
    Task DeleteTodoItem(int id);
    Task<IEnumerable<TodoItemModel>> GetTodoItemsByUser(int id);
    Task InsertTodoItem(TodoItemModel user);
    Task UpdateTodoItem(TodoItemModel user);
}