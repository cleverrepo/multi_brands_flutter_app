import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Order{


}
class DatabaseHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDatabase();
    return _database!;
  }
  Future<Database> initDatabase() async {
    String path = join(await getDatabasesPath(), 'your_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE orders (
          id INTEGER PRIMARY KEY,
          productImage TEXT,
          productName TEXT,
          productQuantity INTEGER,
          productPrice REAL
        )
      ''');
      },
    );
  }
  Future<void> insertData(
      String productImage, String productName, int productQuantity, double productPrice) async {
    final Database db = await database;
    await db.insert(
      'orders',
      {
        'productImage': productImage,
        'productName': productName,
        'productQuantity': productQuantity,
        'productPrice': productPrice,
      },
    );
  }
}