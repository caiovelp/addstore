// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:core';

import 'package:addstore/helper/dataBaseHelper.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:addstore/model/userDataModel.dart';
import '../model/anuncioModel.dart';

class AnuncioController {
  var database = DataBaseHelper().initDb();

  static const TABLE_NAME = 'anuncio';
  static const ID = 'id = ?';
  static const STATE = 'state = ?';
  static const CATEGORY = 'category = ?';
  static const TITLE = 'title = ?';
  static const PRICE = 'price = ?';
  static const TELEPHONE = 'telephone = ?';
  static const DESCRIPTION = 'description = ?';


  Future<int> insertAnuncio(Anuncio anuncio) async {
    try {
      final db = await database;

      int result = await db.insert(
          TABLE_NAME,
          anuncio.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace
      );

      return result;
    } catch (ex) {
      print(ex);
      return 0;
    }
  }
  Future<List<Anuncio>> getAnuncios(String estado, String categoria) async {
    try {
      final db = await database;

      var maps = await db.query(TABLE_NAME);

      if (estado.isEmpty && categoria.isEmpty)
        maps = await db.query(TABLE_NAME);
      else if (estado.isNotEmpty && categoria.isEmpty) {
        maps = await db.query(
          TABLE_NAME,
          where: "state = ?",
          whereArgs: [estado],
        );
      }
      else if (estado.isEmpty && categoria.isNotEmpty) {
        maps = await db.query(
          TABLE_NAME,
          where: "category = ?",
          whereArgs: [categoria],
        );
      }
      else if (estado.isNotEmpty && categoria.isNotEmpty) {
        String sql = '''SELECT * FROM $TABLE_NAME WHERE category = ? AND state = ?''';
        maps = await db.rawQuery(sql, [categoria, estado]);
      }

      return List.generate(
        maps.length,
            (i) {
          return Anuncio.fromMap(maps[i]);
        },
      );
    } catch (ex) {
      print(ex);
      return <Anuncio>[];
    }
  }

  Future<List<Anuncio>> retrieveAnuncio(int id) async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query(
      TABLE_NAME,
      where: "id = ?",
      whereArgs: [id],
    );

    return List.generate(
      maps.length,
          (i) {
        return Anuncio.fromMap(maps[i]);
      },
    );
  }

  Future<List<Anuncio>> getAnuncios2(String estado, String categoria, String price, String title) async {
    try {
      final db = await database;

      var maps = await db.query(TABLE_NAME);

      if (estado.isEmpty && categoria.isEmpty && price.isEmpty && title.isEmpty)
        maps = await db.query(TABLE_NAME);
      else if (estado.isNotEmpty && categoria.isEmpty && price.isEmpty && title.isEmpty) {
        maps = await db.query(
          TABLE_NAME,
          where: "state = ?",
          whereArgs: [estado],
        );
      }
      else if (estado.isEmpty && categoria.isNotEmpty && price.isEmpty && title.isEmpty) {
        maps = await db.query(
          TABLE_NAME,
          where: "category = ?",
          whereArgs: [categoria],
        );
      }
      else if (estado.isEmpty && categoria.isEmpty && price.isNotEmpty && title.isEmpty) {
        maps = await db.query(
          TABLE_NAME,
          where: "price <= ?",
          whereArgs: [double.parse(price)],
        );
      }
      else if (estado.isEmpty && categoria.isEmpty && price.isEmpty && title.isNotEmpty) {
        maps = await db.query(
          TABLE_NAME,
          where: "title LIKE ?",
          whereArgs: ['%$title%'],
        );
      }
      else if (estado.isNotEmpty && categoria.isNotEmpty && price.isEmpty && title.isEmpty) {
        String sql = '''SELECT * FROM $TABLE_NAME WHERE state = ? AND categoria = ?''';
        maps = await db.rawQuery(sql, [estado, categoria]);
      }
      else if (estado.isNotEmpty && categoria.isEmpty && price.isNotEmpty && title.isEmpty) {
        String sql = '''SELECT * FROM $TABLE_NAME WHERE state = ? AND price <= ?''';
        maps = await db.rawQuery(sql, [estado, double.parse(price)]);
      }
      else if (estado.isNotEmpty && categoria.isEmpty && price.isEmpty && title.isNotEmpty) {
        String sql = '''SELECT * FROM $TABLE_NAME WHERE state = ? AND title LIKE ?''';
        maps = await db.rawQuery(sql, [estado, "%$title%"]);
      }
      else if (estado.isEmpty && categoria.isNotEmpty && price.isNotEmpty && title.isEmpty) {
        String sql = '''SELECT * FROM $TABLE_NAME WHERE category = ? AND price <= ?''';
        maps = await db.rawQuery(sql, [categoria, double.parse(price)]);
      }
      else if (estado.isEmpty && categoria.isNotEmpty && price.isEmpty && title.isNotEmpty) {
        String sql = '''SELECT * FROM $TABLE_NAME WHERE category = ? AND title LIKE ?''';
        maps = await db.rawQuery(sql, [categoria, '%$title%']);
      }
      else if (estado.isEmpty && categoria.isEmpty && price.isNotEmpty && title.isNotEmpty) {
        String sql = '''SELECT * FROM $TABLE_NAME WHERE price <= ? AND title LIKE ?''';
        maps = await db.rawQuery(sql, [double.parse(price), '%$title%']);
      }
      else if (estado.isNotEmpty && categoria.isNotEmpty && price.isNotEmpty && title.isEmpty) {
        String sql = '''SELECT * FROM $TABLE_NAME WHERE state = ? AND category = ? AND price <= ?''';
        maps = await db.rawQuery(sql, [estado, categoria, double.parse(price)]);
      }
      else if (estado.isNotEmpty && categoria.isNotEmpty && price.isEmpty && title.isNotEmpty) {
        String sql = '''SELECT * FROM $TABLE_NAME WHERE state = ? AND category = ? AND title LIKE ?''';
        maps = await db.rawQuery(sql, [estado, categoria, '%$title%']);
      }
      else if (estado.isNotEmpty && categoria.isEmpty && price.isNotEmpty && title.isNotEmpty) {
        String sql = '''SELECT * FROM $TABLE_NAME WHERE state = ? AND price <= ? AND title LIKE ?''';
        maps = await db.rawQuery(sql, [estado, double.parse(price), '%$title%']);
      }
      else if (estado.isEmpty && categoria.isNotEmpty && price.isNotEmpty && title.isNotEmpty) {
        String sql = '''SELECT * FROM $TABLE_NAME WHERE category = ? AND price <= ? AND title LIKE ?''';
        maps = await db.rawQuery(sql, [categoria, double.parse(price), '%$title%']);
      }
      else if (estado.isNotEmpty && categoria.isNotEmpty && price.isNotEmpty && title.isNotEmpty) {
        String sql = '''SELECT * FROM $TABLE_NAME WHERE state = ? AND category = ? AND price <= ? AND title LIKE ?''';
        maps = await db.rawQuery(sql, [estado, categoria, double.parse(price), '%$title%']);
      }

      return List.generate(
        maps.length,
            (i) {
          return Anuncio.fromMap(maps[i]);
        },
      );
    } catch (ex) {
      print(ex);
      return <Anuncio>[];
    }
  }

  Future<List<Anuncio>> getAnunciosByID(int userId) async {
    try {
      final db = await database;
      final List<Map<String, dynamic>> maps = await db.query(
        TABLE_NAME,
        where: "user_id = ?",
        whereArgs: [userId],
      );

      return List.generate(
        maps.length,
            (i) {
          return Anuncio.fromMap(maps[i]);
        },
      );
    } catch (ex) {
      print(ex);
      return <Anuncio>[];
    }
  }

  Future update(Anuncio anuncio) async {

    try {
      final Database db =  await DataBaseHelper().initDb();

      await db.update(TABLE_NAME, anuncio.toMap(), where: ID, whereArgs: [anuncio.id]);

    } catch (ex) {
      print(ex);
      return;
    }
  }

  Future delete(int anuncioID) async {
    try {
      final Database db = await DataBaseHelper().initDb();
      await db.delete(TABLE_NAME, where: 'id = ?', whereArgs: [anuncioID]);
    }
    catch(ex) {
      print(ex);
      return;
    }
  }
}