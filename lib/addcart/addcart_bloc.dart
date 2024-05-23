import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proife/addcart/addcart_events.dart';
import 'package:proife/addcart/addcart_states.dart';
import 'package:proife/db/cart_db.dart';
import 'package:proife/global.dart';

import '../productlistmodel.dart';

class AddCartBloc extends Bloc<AddCartEvent,AddCartState>{
  // CartDataBase dbCart =  CartDataBase();
  AddCartBloc( ): super(AddCartLoading()) {
    on<AddItemEvent>((event,emit)async{
      emit(AddCartLoading());
      try{
       listCartItem.add(event.prductlistmodel!);
     //  dbCart.insertCart(event.prductlistmodel!);
       emit(AddItemCartState(addToCartList:listCartItem ));

      }catch(e){
        print(e.toString());
      }
    }
    );
    on<RemoveItemEvent>((event,emit)async{
      emit(AddCartLoading());
      try{
        listCartItem.remove(event.prductlistmodel);
       emit(RemoveItemCartState(removeToCart: listCartItem));
        listCartItem.forEach((element) {
          print(element.title);
        });
      }catch(e){
        print(e.toString());
      }
    });
  }
}