import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proife/addcart/addcart_events.dart';
import 'package:proife/addcart/addcart_states.dart';
import 'package:proife/db/cart_db.dart';


class AddCartBloc extends Bloc<AddCartEvent,AddCartState>{
   CartDataBase dbCart =  CartDataBase();
  AddCartBloc(): super(AddCartLoading()) {
    on<AddItemEvent>((event,emit)async{
      emit(AddCartLoading());
      try{
      var result =  await dbCart.update(event.prductlistmodel!,1);
        emit(AddItemCartState(addToCartList:result ));
        }catch(e){
        print(e.toString());
      }
    }
    );
    on<RemoveItemEvent>((event,emit)async{
      emit(AddCartLoading());
      try{
        await dbCart.deleteCart(event.prductlistmodel!.id!);
        final getLoad = await dbCart.retriveCart();
       emit(RemoveItemCartState(removeToCart: getLoad!));
     }catch(e){
        print(e.toString());
      }
    });
  }
}