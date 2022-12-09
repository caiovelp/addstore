import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DataBaseHelper {
  static final DataBaseHelper _instance = DataBaseHelper.internal();
  static const _CREATE_USER_TABLE_SCRIPT = """
            CREATE TABLE user( 
              id INTEGER PRIMARY KEY AUTOINCREMENT, 
              name VARCHAR NOT NULL,
              email VARCHAR NOT NULL, 
              password VARCHAR NOT NULL
            );""";
  static const _CREATE_ANUNCIO_TABLE_SCRIPT = """
            CREATE TABLE anuncio( 
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              state VARCHAR(2) NOT NULL,
              category VARCHAR NOT NULL,
              title TEXT NOT NULL,
              price REAL NOT NULL,
              telephone VARCHAR(20) NOT NULL,
              description TEXT NOT NULL,
              photo BLOB,
              user_id INTEGER,
              FOREIGN_KEY(user_id) REFERENCES user(id) 
            );""";
  factory DataBaseHelper() => _instance;

  DataBaseHelper.internal();

  Future<Database> initDb() async {
    final databasePath = await getDatabasesPath();

    final path = join(databasePath, "users_database.db");

    Database db = await openDatabase(
        path,
        version: 1,
        onCreate: (db, version) async {

          String sql = _CREATE_USER_TABLE_SCRIPT + _CREATE_ANUNCIO_TABLE_SCRIPT;
          await db.execute(sql);

        }
    );

    return db;
  }
}