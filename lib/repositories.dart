import 'dart:convert';

import 'package:proife/productlistmodel.dart';
import 'package:http/http.dart';

class UserRepository{
  String prdcturl ="https://fakestoreapi.com/products";
  Future<List<Prductlistmodel>> getPrdts() async{
    Response response =await get(Uri.parse(prdcturl));
    if(response.statusCode ==200){
       final List result = jsonDecode(response.body);
       return result.map<Prductlistmodel>((i)=>Prductlistmodel.fromJson(i)).toList();
     // final List result = ;

    }else{
      throw Exception('Failed to load data');
    }
  }
}