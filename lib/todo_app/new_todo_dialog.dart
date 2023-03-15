import 'package:flutter/material.dart';
import 'package:flutter_demo/todo_app/todo.dart';

class NewTodoDialog extends StatelessWidget {
  NewTodoDialog({Key? key}) : super(key: key);

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("New Todo"),
      content: TextField(
        controller: controller,
        autofocus: true,
      ),
      actions: [
        TextButton(
            onPressed: () {
              controller.clear();
              Navigator.of(context).pop();
            },
            child: const Text("Cancel")
        ),
        TextButton(
            onPressed: () {
              final todo = Todo(title: controller.value.text);
              controller.clear();
              Navigator.of(context).pop(todo);
            },
            child: const Text("Add")
        )
      ],
    );
  }
}
