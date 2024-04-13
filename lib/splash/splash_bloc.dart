import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:proife/splash/splsh_event.dart';
import 'package:proife/splash/splsh_states.dart';

class SplashBloc extends Bloc<SplashEvent,SplashState>{
  SplashBloc( ): super(SplashScreenIntial()){
    on<SplashScreenLoadEvent>((event,emit) async{
      emit(SplashScreenLoad());
   await   Future.delayed(const Duration(seconds: 5));
      emit(SplashScreenCompleted());
    });

  }

}