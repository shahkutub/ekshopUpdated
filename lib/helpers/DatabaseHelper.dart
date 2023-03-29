import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../data_model/cart_item.dart';

class DatabaseHelper {
  static final _databaseName = "ekshop.db";
  static final _databaseVersion = 1;

  static final table = 'cart';

  static final columnId = 'id';
  static final columnName = 'name';
  static final columnPrice = 'price';
  static final columnQuantity = 'quantity';

  // Make this a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

// Only have a single app-wide reference to the database
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await _initDatabase();
    return _database;
  }

  // open the database
  _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }


  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $table (
        $columnId TEXT,
        $columnName TEXT,
        $columnPrice TEXT,
        $columnQuantity INTEGER
      )
    ''');
  }

  // insert drug
  Future<int> addCartItem(Map<String, dynamic> row) async {
    Database db = await database;
    return await db.insert(
        table, row, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> addItem(CartItem item) async {
    final db = await database;
    return await db.insert(table, item.toMap());
  }

  Future<int> updateItem(CartItem item) async {
    final db = await database;
    return await db.update(
      table,
      item.toMap(),
      where: '$columnId = ?',
      whereArgs: [item.id],
    );
  }

  Future<int> deleteItem(int id) async {
    final db = await database;
    return await db.delete(
      table,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }

  Future<List<CartItem>> getCartItems() async {
    var dbClient = await database;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM cart');
    List<CartItem> cartItems = [];
    for (int i = 0; i < list.length; i++) {
      cartItems.add(CartItem.fromMap(list[i]));
    }
    return cartItems;
  }

}