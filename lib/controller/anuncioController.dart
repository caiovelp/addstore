import 'package:addstore/helper/dataBaseHelper.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import '../model/anuncioModel.dart';

class AnuncioController {
  static const TABLE_NAME = 'advertisement';

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
  Future<List<Anuncio>> getContacts() async {
    try {
      final Database db = await DataBaseHelper().initDb();
      final List<Map<String, dynamic>> maps = await db.query(TABLE_NAME);

      return List.generate(
        maps.length,
            (i) {
          return Anuncio().fromMap(maps[i]);
        },
      );
    } catch (ex) {
      print(ex);
      return <Anuncio>[];
    }
  }
}