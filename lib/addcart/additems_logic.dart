 import 'package:proife/addcart/addcart_model.dart';

class AddItemsCartsLogic {
  List<AddItemCart> listCartItem =[];

  Future<List<AddItemCart>?> addItemsToCart(AddItemCart addItemCart)async{
    listCartItem.add(addItemCart);
    return listCartItem;
   }
   Future<List<AddItemCart>?> removeItemToCart(AddItemCart addItemCart)async{
    listCartItem.remove(addItemCart);
   }
 }