import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/todo_app/todo_list_screen.dart';

void todoMain() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Todo List",
      home: TodoListScreen()
    );
  }
}
