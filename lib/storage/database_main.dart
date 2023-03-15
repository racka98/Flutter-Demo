import 'package:flutter/material.dart';
import 'package:flutter_demo/storage/database_helpers.dart';

class DatabasePersistenceApp extends StatelessWidget {
  const DatabasePersistenceApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Database Persistence",
      theme: ThemeData(primarySwatch: Colors.amber),
      home: const DatabasePersistenceHome(),
    );
  }
}

class DatabasePersistenceHome extends StatefulWidget {
  const DatabasePersistenceHome({Key? key}) : super(key: key);

  @override
  State<DatabasePersistenceHome> createState() =>
      _DatabasePersistenceHomeState();
}

class _DatabasePersistenceHomeState extends State<DatabasePersistenceHome> {
  List<Word> words = List.empty();

  final _controller = TextEditingController();
  final _controllerF = TextEditingController();

  @override
  void initState() {
    super.initState();
    _read();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Database Persistence"),
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(hintText: "Enter Word"),
                  ),
                ),
                const SizedBox(width: 32.0),
                Flexible(
                  child: TextField(
                    controller: _controllerF,
                    keyboardType: TextInputType.number,
                    decoration:
                        const InputDecoration(hintText: "Enter Frequency"),
                  ),
                ),
              ],
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
          ),
          Expanded(
            child: WordsList(words: words),
          )
        ],
      ),
    );
  }

  void _read() async {
    final DatabaseHelper helper = DatabaseHelper.instance;
    final savedWords = await helper.queryAllWords();
    setState(() {
      words = savedWords;
    });
  }

  void _save() async {
    final DatabaseHelper helper = DatabaseHelper.instance;
    final word = Word(
        word: _controller.value.text,
        frequency: int.tryParse(_controllerF.value.text) ?? 0);
    helper.insert(word);
    _read();
  }
}

class WordsList extends StatelessWidget {
  const WordsList({Key? key, required List<Word> words})
      : _words = words,
        super(key: key);

  final List<Word> _words;

  Widget _buildItem(BuildContext context, int index) {
    final word = _words[index];
    return Text(
        "Word: ${word.word}, Frequency: ${word.frequency}, ID: ${word.id}");
  }

  @override
  Widget build(BuildContext context) {
    return _words.isEmpty
        ? const Text("No Words Saved!")
        : ListView.separated(
            padding: const EdgeInsets.all(16.0),
            itemBuilder: _buildItem,
            separatorBuilder: (context, index) => const Divider(),
            itemCount: _words.length);
  }
}
