﻿namespace DataAccess.Models;

public class TodoItemModel
{
    public int TodoItemId { get; set; }
    public DateTime DueOn { get; set; }
    public string Title { get; set; }
    public string Status { get; set; }
    public int? UserId { get; set; }
}