// Database table and column names
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

part 'database_helpers.g.dart';

const String tableWords = "words";
const columnId = "_id";
const columnWord = "word";
const columnFrequency = "frequency";

// Data Model class
class WordDb extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get word => text()();

  IntColumn get frequency => integer()();
}

class Word {
  final int? id;
  final String word;
  final int frequency;

  Word({this.id, required this.word, required this.frequency});

  // convenience constructor to create a Word object
  static Word fromMap(Map<String, dynamic> map) => Word(
      id: map[columnId],
      word: map[columnWord],
      frequency: map[columnFrequency]);

  // convenience method to create a Map from this Word object
  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{columnWord: word, columnFrequency: frequency};
    if (id != null) map[columnId] = id;
    return map;
  }
}

@DriftDatabase(tables: [WordDb])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  void hello() {
    var hey = (select(wordDb)..where((tbl) => tbl.id.equals(1))).getSingle();
  }
}

LazyDatabase _openConnection() => LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(path.join(dbFolder.path, "db.sqlite"));
      if (kDebugMode) {
        print("Database connection created");
      }
      return NativeDatabase.createInBackground(file);
    });

// singleton class to manage the database
class DatabaseHelper {
  // This is the actual database filename that is saved in the docs directory.
  static const _databaseName = "MyDatabase.db";

  // Increment this version when you need to change the schema.
  static const _databaseVersion = 1;

  // Make this a singleton class.
  DatabaseHelper._privateConstructor();

  static final instance = DatabaseHelper._privateConstructor();

  // Only allow a single open connection to the database.
  final MyDatabase _database = MyDatabase();

  // Database helper methods:

  Future<int> insert(Word word) async =>
      _database.into(_database.wordDb).insert(
          WordDbCompanion.insert(word: word.word, frequency: word.frequency));

  Future<Word?> queryWord(int id) async =>
      (_database.select(_database.wordDb)..where((tbl) => tbl.id.equals(id)))
          .map((w) => Word(id: w.id, word: w.word, frequency: w.frequency))
          .getSingleOrNull();

  Future<List<Word>> queryAllWords() async => _database
      .select(_database.wordDb)
      .map((w) => Word(id: w.id, word: w.word, frequency: w.frequency))
      .get();

// TODO: delete(int id)
// TODO: update(Word word)
}
