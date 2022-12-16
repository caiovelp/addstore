// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:addstore/helper/dataBaseHelper.dart';
import 'package:addstore/model/userDataModel.dart';

class LoginController {
  var database = DataBaseHelper().initDb();

  Future<int> getLogin(String username, String password) async {
    final db = await database;

    String sql = 'SELECT * FROM user '
        """WHERE name='$username' and password='$password'""";

    var result = await db.rawQuery(sql);
    if (result.isNotEmpty)
      return 1;
    else
      return 0;
  }

  Future<List<User>> retrieveUserID(String username) async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query(
      'user',
      where: "name = ?",
      whereArgs: [username],
    );

    return List.generate(
      maps.length,
          (i) {
        return User.fromMap(maps[i]);
      },
    );
  }
}