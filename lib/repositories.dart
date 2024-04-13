import 'dart:convert';
import 'package:http/http.dart';
 import 'package:proife/productlistmodel.dart';

class UserRepository {
  String prdcturl = "https://fakestoreapi.com/products";
  Future<List<Prductlistmodel>?> getPrdts() async {
    try{
      Response response = await get(Uri.parse(prdcturl));
      if (response.statusCode == 200) {
        print(response.body);
        final List<dynamic> result = jsonDecode(response.body);
        return result.map((json) => Prductlistmodel(
          id: json['id'],
          title: json['title'],
         price: json['price'].toString(),
          description: json['description'],
          category: json['category'],
          image: json['image'],
         rating:  Rating(rate: json['rating']['rate'].toString(),count: json['rating']['count']),
        )).toList();

        } else {
        throw Exception('Failed to load data');
      }
    }catch(e){
      print(e.toString());
    }
    return null;

  }
}