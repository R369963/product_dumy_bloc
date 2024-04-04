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
          final users = await userRepository?.getPrdts();
       }catch(e){
          emit(UserErrorState(e.toString()));
       }
    });
   }
}