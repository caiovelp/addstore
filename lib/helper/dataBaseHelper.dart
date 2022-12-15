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
              user_id INTEGER
            );""";
  factory DataBaseHelper() => _instance;

  DataBaseHelper.internal();

  Future<Database> initDb() async {
    print("initDB executed");
    final databasePath = await getDatabasesPath();

    final path = join(databasePath, "mydatabase.db");

    Database db = await openDatabase(
        path,
        version: 1,
        onCreate: (db, version) async {

          String sqlUser = _CREATE_USER_TABLE_SCRIPT;
          String sqlAnuncio = _CREATE_ANUNCIO_TABLE_SCRIPT;
          db.execute(sqlUser);
          db.execute(sqlAnuncio);

        }
    );

    return db;
  }

  Future<void> deleteDatabase(String path) =>
      databaseFactory.deleteDatabase(path);

}