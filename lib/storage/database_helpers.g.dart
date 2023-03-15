// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_helpers.dart';

// ignore_for_file: type=lint
class $WordDbTable extends WordDb with TableInfo<$WordDbTable, WordDbData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WordDbTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _wordMeta = const VerificationMeta('word');
  @override
  late final GeneratedColumn<String> word = GeneratedColumn<String>(
      'word', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _frequencyMeta =
      const VerificationMeta('frequency');
  @override
  late final GeneratedColumn<int> frequency = GeneratedColumn<int>(
      'frequency', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, word, frequency];
  @override
  String get aliasedName => _alias ?? 'word_db';
  @override
  String get actualTableName => 'word_db';
  @override
  VerificationContext validateIntegrity(Insertable<WordDbData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('word')) {
      context.handle(
          _wordMeta, word.isAcceptableOrUnknown(data['word']!, _wordMeta));
    } else if (isInserting) {
      context.missing(_wordMeta);
    }
    if (data.containsKey('frequency')) {
      context.handle(_frequencyMeta,
          frequency.isAcceptableOrUnknown(data['frequency']!, _frequencyMeta));
    } else if (isInserting) {
      context.missing(_frequencyMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WordDbData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WordDbData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      word: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}word'])!,
      frequency: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}frequency'])!,
    );
  }

  @override
  $WordDbTable createAlias(String alias) {
    return $WordDbTable(attachedDatabase, alias);
  }
}

class WordDbData extends DataClass implements Insertable<WordDbData> {
  final int id;
  final String word;
  final int frequency;
  const WordDbData(
      {required this.id, required this.word, required this.frequency});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['word'] = Variable<String>(word);
    map['frequency'] = Variable<int>(frequency);
    return map;
  }

  WordDbCompanion toCompanion(bool nullToAbsent) {
    return WordDbCompanion(
      id: Value(id),
      word: Value(word),
      frequency: Value(frequency),
    );
  }

  factory WordDbData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WordDbData(
      id: serializer.fromJson<int>(json['id']),
      word: serializer.fromJson<String>(json['word']),
      frequency: serializer.fromJson<int>(json['frequency']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'word': serializer.toJson<String>(word),
      'frequency': serializer.toJson<int>(frequency),
    };
  }

  WordDbData copyWith({int? id, String? word, int? frequency}) => WordDbData(
        id: id ?? this.id,
        word: word ?? this.word,
        frequency: frequency ?? this.frequency,
      );
  @override
  String toString() {
    return (StringBuffer('WordDbData(')
          ..write('id: $id, ')
          ..write('word: $word, ')
          ..write('frequency: $frequency')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, word, frequency);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WordDbData &&
          other.id == this.id &&
          other.word == this.word &&
          other.frequency == this.frequency);
}

class WordDbCompanion extends UpdateCompanion<WordDbData> {
  final Value<int> id;
  final Value<String> word;
  final Value<int> frequency;
  const WordDbCompanion({
    this.id = const Value.absent(),
    this.word = const Value.absent(),
    this.frequency = const Value.absent(),
  });
  WordDbCompanion.insert({
    this.id = const Value.absent(),
    required String word,
    required int frequency,
  })  : word = Value(word),
        frequency = Value(frequency);
  static Insertable<WordDbData> custom({
    Expression<int>? id,
    Expression<String>? word,
    Expression<int>? frequency,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (word != null) 'word': word,
      if (frequency != null) 'frequency': frequency,
    });
  }

  WordDbCompanion copyWith(
      {Value<int>? id, Value<String>? word, Value<int>? frequency}) {
    return WordDbCompanion(
      id: id ?? this.id,
      word: word ?? this.word,
      frequency: frequency ?? this.frequency,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (word.present) {
      map['word'] = Variable<String>(word.value);
    }
    if (frequency.present) {
      map['frequency'] = Variable<int>(frequency.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WordDbCompanion(')
          ..write('id: $id, ')
          ..write('word: $word, ')
          ..write('frequency: $frequency')
          ..write(')'))
        .toString();
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  late final $WordDbTable wordDb = $WordDbTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [wordDb];
}
