
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proife/addcart/addcart_events.dart';
import 'package:proife/addcart/addcart_model.dart';
import 'package:proife/addcart/addcart_states.dart';
import 'package:proife/addcart/additems_logic.dart';

import '../productlistmodel.dart';

class AddCartBloc extends Bloc<AddCartEvent,AddCartState>{
  Prductlistmodel? addItemCart;
  AddItemsCartsLogic? addItemsCartsLogic;
  AddCartBloc(this.addItemsCartsLogic): super(AddCartLoading()){
    on<AddCartEvent>((event,emit)async{
      emit(AddCartLoading());
      try{
        final getCartList = await addItemsCartsLogic!.addItemsToCart(addItemCart!);
        emit(GetCartItems(getCartItems: getCartList!));
      }catch(e){
        print(e.toString());
      }
    }
    );
    on<RemoveItemEvent>((event,emit)async{
      emit(AddCartLoading());
      try{
        final getCartList =  await addItemsCartsLogic!.removeItemToCart(addItemCart!);
        emit(GetCartItems(getCartItems: getCartList!));
      }catch(e){
        print(e.toString());
      }
    });
  }
}