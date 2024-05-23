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
         await db.execute("CREATE TABLE cart(id INTEGER PRIMARY KEY, title TEXT NOT NULL,price TEXT NOT NULL,description TEXT NOT NULL,category TEXT NOT NULL,image TEXT NOT NULL,fav INTEGER NOT NULL DEFAULT 0)"
         );
      },
    );
  }
  Future<int> insertCart(
      Prductlistmodel products
      )async{
    var value ={
      "id":products.id,
      "title":products.title,
      "price":products.price,
      "description":products.description,
      "category":products.category,
      "image":products.image,
      "fav":0
    };
    int result =0;
   try{
     final Database? db = await initializeDB();
     result =await db!.insert('cart', value ,
         conflictAlgorithm: ConflictAlgorithm.replace);

   }catch(e){
     print("$e ERROR DATA BASE");
   }
    if(result==0){
      print("Not Saved$result");
    }else{
      print("Saves$result");
    }
  return result;
  }
Future<List<Prductlistmodel>?> retriveCart()async{
    final Database? db = await initializeDB();
    final List<Map<String, Object?>> queryResult =await db!.query('cart');
    return queryResult.map((e)=> Prductlistmodel.fromJson(e)).toList();
}
Future<void> update(Prductlistmodel products)async{
  var value ={
    "id":products.id,
    "title":products.title,
    "price":products.price,
    "description":products.description,
    "category":products.category,
    "image":products.image,
    "fav":1
  };
  int result =0;
    try{
      final Database? db = await initializeDB();
      result = await db!.update('cart', value,where: "id = ?", whereArgs: [products.id]);
    }catch(e){
      print("$e Update ERRoR");
    }
    print("$result update");
  }
Future<void> deleteCart(int id)async{
    final db =  await initializeDB();
    await db!.delete('cart',where: "id = ?",
    whereArgs: [id]);
}
}