import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../data_model/cart_item.dart';

class DatabaseHelper {
  static final _databaseName = "ekshop.db";
  static final _databaseVersion = 1;

  static final tableCart = 'cart';

  static final columnId = 'id';
  static final columnName = 'name';
  static final columnPrice = 'price';
  static final columnQuantity = 'quantity';
  static final columnCartImageUrl = 'imageUrl';
  static final columnCartDetailJson = 'detailjson';

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
      CREATE TABLE $tableCart (
        $columnId TEXT,
        $columnName TEXT,
        $columnPrice TEXT,
        $columnCartDetailJson TEXT,
        $columnCartImageUrl TEXT,
        $columnQuantity INTEGER
      )
    ''');
  }

  // insert drug
  Future<int> addCartItem(Map<String, dynamic> row) async {
    Database db = await database;
    return await db.insert(
        tableCart, row, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> addItem(CartItem item) async {
    final db = await database;
    return await db.insert(tableCart, item.toMap());
  }

  Future<int> updateItem(CartItem item) async {
    final db = await database;
    return await db.update(
      tableCart,
      item.toMap(),
      where: '$columnId = ?',
      whereArgs: [item.id],
    );
  }

  Future<int> deleteItem(String id) async {
    final db = await database;
    return await db.delete(
      tableCart,
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