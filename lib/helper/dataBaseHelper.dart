import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DataBaseHelper {
  static final DataBaseHelper _instance = DataBaseHelper.internal();

  factory DataBaseHelper() => _instance;

  DataBaseHelper.internal();

  Future<Database> initDb() async {
    final databasePath = await getDatabasesPath();

    final path = join(databasePath, "users_database.db");

    Database db = await openDatabase(
        path,
        version: 1,
        onCreate: (db, version) async {

          String sql = """
            CREATE TABLE user( 
              id INTEGER PRIMARY KEY AUTOINCREMENT, 
              name VARCHAR NOT NULL,
              email VARCHAR NOT NULL, 
              password VARCHAR NOT NULL
            );
            CREATE TABLE advertisement(
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              state VARCHAR NOT NULL,
              category VARCHAR(2) NOT NULL,
              title TEXT NOT NULL,
              price REAL NOT NULL,
              telephone VARCHAR(20) NOT NULL,
              description TEXT NOT NULL,
              photo BLOB,
              user_id INTEGER,
              FOREIGN KEY(user_id) REFERENCES User(id)
            );""";
          await db.execute(sql);

        }
    );

    return db;
  }
}