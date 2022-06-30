// ignore_for_file: unused_import, unused_field, unnecessary_this, prefer_conditional_assignment, deprecated_member_use, prefer_collection_literals, unnecessary_string_interpolations, unnecessary_brace_in_string_interps

import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:fergie_time/classes/match.dart';
import 'package:fergie_time/classes/comp.dart';

class DBHelper {
  static DBHelper _dbHelper;
  static Database _database;

  DBHelper._createObject();

  Future<Database> initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'football.db';
    var footballDb = await openDatabase(path, version: 1, onCreate: _createDb);
    return footballDb;
  }

  void _createDb(Database db, int version) async {
    // await db.delete('''football''');
    await db.execute('''CREATE TABLE football(
        id INTEGER PRIMARY KEY AUTOINCREMENT, 
        event TEXT,  
        score_team TEXT,
        score_opponent TEXT,
        opponent TEXT,
        date TEXT)
      ''');
  }

  // Select Database
  Future<List<Map<String, dynamic>>> select() async {
    Database db = await this.initDb();
    var result = await db.query('football', orderBy: 'event');
    return result;
  }

  // Select Event
  Future<List<Map<String, dynamic>>> selectEvent(String object) async {
    Database db = await this.initDb();
    var result =
        await db.rawQuery('SELECT * FROM football WHERE event = ' + object);
    return result;
  }

  //Create Database
  Future<dynamic> insert(Match object) async {
    Database db = await this.initDb();
    return await db.insert('football', object.toMap());
    // int count = await db.rawInsert('''
    //   INSERT INTO football (event, score_team, score_opponent, opponent, date)
    // ''', [
    //   object.event,
    //   object.score_team,
    //   object.score_opponent,
    //   object.opponent,
    //   object.date
    // ]);
  }

  //Update Database
  Future<int> update(Match object) async {
    Database db = await this.initDb();
    int count = await db.update('football', object.toMap(),
        where: 'id=?', whereArgs: [object.id]);
    return count;
  }

  //Delete database
  Future<int> delete(int id) async {
    Database db = await this.initDb();
    int count = await db.delete('football', where: 'id=?', whereArgs: [id]);
    return count;
  }

  // Future<List<Match>> getMatchList() async {
  //   var matchList = await select();
  //   int count = matchList.length;
  //   List<Match> listMatch = List<Match>();
  //   for (int i = 0; i < count; i++) {
  //     listMatch.add(Match.fromMap(matchList[i]));
  //   }
  //   return listMatch;
  // }

  // Future<List<Match>> getMatchList() async {
  //   final Database db = await initDb();
  //   final List<Map<String, Object>> listMatch = await db.query('football');
  //   return listMatch.map((e) => Match.fromMap(e)).toList();
  // }

  Future<List<Match>> getMatchList(String object) async {
    final Database db = await initDb();
    final List<Map<String, Object>> listMatch =
        await db.query('football', where: 'event = ?', whereArgs: [object]);
    return listMatch.map((e) => Match.fromMap(e)).toList();
  }

  factory DBHelper() {
    if (_dbHelper == null) {
      _dbHelper = DBHelper._createObject();
    }
    return _dbHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initDb();
    }
    return _database;
  }
}
