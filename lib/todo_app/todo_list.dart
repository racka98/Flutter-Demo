import 'package:flutter/material.dart';
import 'package:flutter_demo/todo_app/todo.dart';

typedef ToggleTodoCallback = Function(Todo todo, bool isChecked);

class TodoList extends StatelessWidget {

  const TodoList({super.key, required this.todos, required this.onTodoToggle});

  final List<Todo> todos;
  final ToggleTodoCallback onTodoToggle;

  Widget _buildItem(BuildContext context, int index) {
    final todo = todos[index];
    return CheckboxListTile(
        value: todo.isDone,
        title: Text(todo.title),
        onChanged: (bool? isChecked) {
          onTodoToggle(todo, isChecked ?? false);
        });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: _buildItem,
      itemCount: todos.length,
    );
  }
}
