import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proife/productlistmodel.dart';
import 'package:proife/repositories.dart';
import 'package:proife/splash/splash_bloc.dart';
import 'package:proife/splash/splsh_event.dart';
import 'package:proife/splash/splsh_states.dart';

import 'app_blocs.dart';
import 'app_events.dart';
import 'app_states.dart';
import 'widget/product_widget.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
  ));
}
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: MultiBlocProvider(providers: [
        BlocProvider<SplashBloc>(create: (BuildContext context)=>SplashBloc(),),
      ], child:splashBody() ),
    );
  }
}
Widget splashBody(){
  return Container(
     child: BlocProvider(
       create: (context) => SplashBloc()..add(SplashScreenLoadEvent()),
       child:BlocBuilder<SplashBloc,SplashState>(builder: (BuildContext context, SplashState state) {
         if(state is SplashScreenLoad ){
           print("Stay to Complete timer");
           return Container(
             child: Center(
                child: DateTime.now().hour > 11 && DateTime.now().hour < 15 ?Text("Good Afternoon",
                  style: Theme.of(context).textTheme.titleSmall!.merge(
                     const TextStyle(
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                          color: Colors.redAccent
                      )
                  ),): DateTime.now().hour > 15 &&  DateTime.now().hour < 20 ? Text("Good Evening",
                  style: Theme.of(context).textTheme.titleSmall!.merge(
                      TextStyle(
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                          color: Colors.orange[800]
                      )
                  ),) :
               DateTime.now().hour > 20  ?Text("Good Night",
                 style: Theme.of(context).textTheme.titleSmall!.merge(
                   const TextStyle(
                         fontSize: 18,
                         fontStyle: FontStyle.italic,
                         color: Colors.black45
                     )
                 ),) : Text("Good Morning",
               style: Theme.of(context).textTheme.titleSmall!.merge(
                 TextStyle(
                   fontSize: 18,
                   fontStyle: FontStyle.italic,
                   color: Colors.amber[200]
                 )
               ),),
             ),
           );
         }
         if(state is  SplashScreenCompleted){
          return HomePage();
          //  return HomePage();
         }
         return Center(child: Text("Wroung"));
       },)
     ),
  );

}


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pickart')),
      body: MultiBlocProvider(
        providers: [
          BlocProvider<UserBloc>(
            create: (BuildContext context) => UserBloc(UserRepository()),
          ),
        ],
        child: blocBody(),
      ),
    );
  }

  Widget blocBody() {
    return BlocProvider(
      create: (context) => UserBloc(UserRepository())..add(LoadUserEvent()),
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is UserErrorState) {
            return const Center(child: Text("Error"));
          }
          if (state is UserLoadState) {
            List<Prductlistmodel>? productList = state.products;
            return Container(
              height: 180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: productList!.length,
                itemBuilder: (_, index) {
                  return ProductCard(prductlistmodel:
                    productList.elementAt(index),);
                  },
              ),
            );
          }

          return Container();
        },
      ),
    );
  }
}
