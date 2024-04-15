 import 'package:proife/addcart/addcart_model.dart';

import '../productlistmodel.dart';

class AddItemsCartsLogic {
  List<Prductlistmodel> listCartItem =[];

  Future<List<Prductlistmodel>?> addItemsToCart(Prductlistmodel addItemCart)async{
    listCartItem.add(addItemCart);
    return listCartItem;
   }
   Future<List<Prductlistmodel>?> removeItemToCart(Prductlistmodel addItemCart)async{
    listCartItem.remove(addItemCart);
   }
 }