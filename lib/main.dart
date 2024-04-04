import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proife/productlistmodel.dart';
import 'package:proife/repositories.dart';

import 'app_blocs.dart';
import 'app_events.dart';
import 'app_states.dart';


void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('The BloC App')),
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
    return BlocBuilder<UserBloc, UserState>(
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
          return ListView.builder(
            itemCount: productList!.length,
            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: Card(
                  color: Theme.of(context).primaryColor,
                  child: ListTile(
                    title: Text(
                      '${productList[index].title}  ${productList[index].category}',
                      style: const TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      '${productList[index].description}',
                      style: const TextStyle(color: Colors.white),
                    ),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        productList[index].image.toString(),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }

        return Container();
      },
    );
  }
}
