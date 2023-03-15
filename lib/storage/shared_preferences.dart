import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesApp extends StatelessWidget {
  const PreferencesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Shared Preferences",
      theme: ThemeData(primarySwatch: Colors.lime),
      home: const SharedPrefHome(),
    );
  }
}

class SharedPrefHome extends StatefulWidget {
  const SharedPrefHome({Key? key}) : super(key: key);

  @override
  State<SharedPrefHome> createState() => _SharedPrefHomeState();
}

class _SharedPrefHomeState extends State<SharedPrefHome> {
  String _savedText = "";

  final _controller = TextEditingController();
  static const _myKey = "pref_key_1";

  @override
  void initState() {
    super.initState();
    _read();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shared Prefs"),
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(_savedText),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: TextField(
              controller: _controller,
            ),
          ),
          Row(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: FilledButton(
                    child: const Text("Read"), onPressed: () => _read()),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: FilledButton(
                    child: const Text("Save"), onPressed: () => _save()),
              )
            ],
          )
        ],
      ),
    );
  }

  void _read() async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString(_myKey) ?? "None";
    setState(() {
      _savedText = value;
    });
  }

  void _save() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_myKey, _controller.value.text);
  }
}
