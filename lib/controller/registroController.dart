import 'package:addstore/helper/dataBaseHelper.dart';
import 'package:addstore/model/userDataModel.dart';
import 'package:sqflite/sqflite.dart';

class RegistroController {
  var database = DataBaseHelper().initDb();

  Future<int> insertUser(User user) async {
    final db = await database;

    int result = await db.insert(
        'user',
        user.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace
    );

    return result;
  }

  Future<int> retrieveData(User user) async {
    final db = await database;

    var username = await db.query('user', where: 'name=?', whereArgs: [user.name]);
    var email = await db.query('user', where: 'email=?', whereArgs: [user.email]);
    if (username.isNotEmpty)
      return 1;
    else if (email.isNotEmpty)
      return 2;
    else
      return 0;
  }
}