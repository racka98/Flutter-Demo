import 'package:flutter/material.dart';

class MvvmApp extends StatelessWidget {
  const MvvmApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MVVM Arch",
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: Scaffold(
        appBar: AppBar(title: const Text("MVVM Start")),
        body: const Center(
          child: Text("MVVM APP"),
        ),
      ),
    );
  }
}
