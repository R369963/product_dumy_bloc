import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proife/addcart/addcart_events.dart';
import 'package:proife/addcart/addcart_states.dart';
import 'package:proife/addcart/additems_logic.dart';

import '../productlistmodel.dart';

class AddCartBloc extends Bloc<AddCartEvent,AddCartState>{
  List<Prductlistmodel> listCartItem =[];

  AddCartBloc( ): super(AddCartLoading()) {
    on<AddItemEvent>((event,emit)async{
      emit(AddCartLoading());
      try{
       listCartItem.add(event.prductlistmodel!);
       emit(AddItemCartState(addToCartList:listCartItem ));
       listCartItem.forEach((element) {
         print(element.id);
       });
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