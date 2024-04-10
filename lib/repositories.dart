import 'dart:convert';
import 'package:http/http.dart';
 import 'package:proife/productlistmodel.dart';

class UserRepository {
  String prdcturl = "https://fakestoreapi.com/products";

  Future<List<Prductlistmodel>> getPrdts() async {
    Response response = await get(Uri.parse(prdcturl));
    if (response.statusCode == 200) {
      print(response.body);
      final List<dynamic> result = jsonDecode(response.body);
      return result.map((item) => Prductlistmodel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}