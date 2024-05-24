import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proife/app_events.dart';
import 'package:proife/app_states.dart';
import 'package:proife/productlistmodel.dart';
import 'package:proife/repositories.dart';

import 'db/cart_db.dart';

class UserBloc extends Bloc<UserEvent,UserState>{
   UserRepository? userRepository;
   CartDataBase dbCart =  CartDataBase();
   List<Prductlistmodel>? getLoad;
   UserBloc(this.userRepository): super(UserLoadingState()){
    on<LoadUserEvent>((event,emit)async{
       emit(UserLoadingState());
       try{
           getLoad = await dbCart.retriveCart();
         if(getLoad!.isEmpty){
          // print("executed");
           final products = await userRepository?.getPrdts();
           for (final product in products!) {
             await dbCart.insertCart(product);
           }
           getLoad = await dbCart.retriveCart();
          }

          emit(UserLoadState(getLoad));
         }catch(e){
          emit(UserErrorState(e.toString()));
       }
    });
   }
}