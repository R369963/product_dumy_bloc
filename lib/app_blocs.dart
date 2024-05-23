import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proife/app_events.dart';
import 'package:proife/app_states.dart';
import 'package:proife/repositories.dart';

import 'db/cart_db.dart';

class UserBloc extends Bloc<UserEvent,UserState>{
   UserRepository? userRepository;
   CartDataBase dbCart =  CartDataBase();

   UserBloc(this.userRepository): super(UserLoadingState()){
    on<LoadUserEvent>((event,emit)async{
       emit(UserLoadingState());
       try{
          final products = await userRepository?.getPrdts();
          for (final product in products!) {
           await  dbCart.insertCart(product);
          }
          final getLoad = await dbCart.retriveCart();
          emit(UserLoadState(getLoad));
         }catch(e){
          emit(UserErrorState(e.toString()));
       }
    });
   }
}