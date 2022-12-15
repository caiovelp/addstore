import 'dart:core';

import 'package:addstore/helper/dataBaseHelper.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:addstore/model/userDataModel.dart';
import '../model/anuncioModel.dart';

class AnuncioController {
  static const TABLE_NAME = 'advertisement';
  static const ID = 'id = ?';
  static const STATE = 'state = ?';
  static const CATEGORY = 'category = ?';
  static const TITLE = 'title = ?';
  static const PRICE = 'price = ?';
  static const TELEPHONE = 'telephone = ?';
  static const DESCRIPTION = 'description = ?';

  Future create(Anuncio anuncio) async {
    try {
      final Database db = await DataBaseHelper().initDb();

      await db.insert(
        TABLE_NAME,
        anuncio.toMap(),
      );
    } catch (ex) {
      print(ex);
      return;
    }
  }
  Future<List<Anuncio>> getAnuncios() async {
    try {
      final Database db = await DataBaseHelper().initDb();
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

  Future<List<Anuncio>> getMeuAnuncios(User user) async {
    try {
    final Database db = await DataBaseHelper().initDb();
    final List<Map<String, dynamic>> maps = await db.query(
      TABLE_NAME,
      where: "user_id = ?",
      whereArgs: [user.id],
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

      await db.update(TABLE_NAME, anuncio.toMap(), where: 'id = ?', whereArgs: [anuncio.id]);

    } catch (ex) {
      print(ex);
      return;
    }
  }

  Future delete(Anuncio anuncio) async {
    try {
      final Database db = await DataBaseHelper().initDb();
      await db.delete(TABLE_NAME, where: 'id = ?', whereArgs: [anuncio.id]);
    }
    catch(ex) {
      print(ex);
      return;
    }
  }
}