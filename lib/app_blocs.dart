import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proife/app_events.dart';
import 'package:proife/app_states.dart';
import 'package:proife/repositories.dart';

class UserBloc extends Bloc<UserEvent,UserState>{
   UserRepository? userRepository;
   UserBloc(this.userRepository): super(UserLoadingState()){
    on<LoadUserEvent>((event,emit)async{
       emit(UserLoadingState());
       try{
          final products = await userRepository?.getPrdts();
          for (final product in products!) {
             print(product.title);
             print(product.price);
print(product.rating?.rate);
print(product.rating?.count);
             print('---');
          }
          emit(UserLoadState(products));

       }catch(e){
          emit(UserErrorState(e.toString()));
       }
    });
   }
}