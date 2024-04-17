import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../productlistmodel.dart';

class CartDataBase{
  Future<Database?> initializeDB()async{
    String path =  await getDatabasesPath();
    return openDatabase(
      join(path,'cart.db'),
      version: 1,
      onCreate: (Database db, int version)async{
         await db.execute("CREATE TABLE cart( id INTEGER PRIMARY KEY, title TEXT NOT NULL)"
         );
      },
    );
  }
  Future<int> insertCart(
      List<Prductlistmodel> products
      )async{
    int result =0;
    final Database? db = await initializeDB();
    for(var product  in products){
      result =await db!.insert('cart',  product.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace);
    }
  return result;
  }
Future<List<Prductlistmodel>?> retriveCart()async{
    final Database? db = await initializeDB();
    final List<Map<String, Object?>> queryResult =await db!.query('cart');
    return queryResult.map((e)=> Prductlistmodel.fromJson(e)).toList();
}
Future<void> deleteCart(int id)async{
    final db =  await initializeDB();
    await db!.delete('cart',where: "id = ?",
    whereArgs: [id]);
}
}