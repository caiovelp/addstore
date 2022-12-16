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

      print("TOMALHE");

      return result;
    } catch (ex) {
      print(ex);
      return 0;
    }
  }
  Future<List<Anuncio>> getAnuncios() async {
    try {
      final db = await database;
      final List<Map<String, dynamic>> maps = await db.query(TABLE_NAME);

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