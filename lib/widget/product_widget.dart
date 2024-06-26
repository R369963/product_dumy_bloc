import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proife/addcart/addcart_events.dart';

import 'package:proife/productlistmodel.dart';

import '../addcart/addcart_bloc.dart';
import '../addcart/addcart_states.dart';
import '../db/cart_db.dart';

class ProductCard extends StatelessWidget {
  Prductlistmodel prductlistmodel;
  CartDataBase? cartDataBase =CartDataBase();
  ProductCard({required this.prductlistmodel});

  @override
  Widget build(BuildContext context) {
   // bool isAddedToCart = false;
    bool  isAddedToCart =  prductlistmodel.fav ==1 ?true:false;

    bool addCart = false;
    return Card(
      shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        height: 180,
        width: 130,
        child: Stack(
           children: [
               Positioned(

               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Image.network(
                     prductlistmodel.image!,
                     width: 130,
                     height: 120,
                     fit: BoxFit.fill,
                   ),
                   const SizedBox(
                     height: 5,
                   ),
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 5),
                     child: Text(
                       prductlistmodel.title.toString(),
                       style: Theme.of(context).textTheme.titleSmall!.merge(
                         const TextStyle(
                             fontSize: 14,
                             fontWeight: FontWeight.bold,
                             color: Colors.black),
                       ),
                       overflow: TextOverflow.ellipsis,
                     ),
                   ),
                   const SizedBox(
                     height: 2,
                   ),
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 5),
                     child: Text(
                       "\u{20B9} ${prductlistmodel.fav}",
                       style: Theme.of(context).textTheme.titleSmall!.merge(
                         TextStyle(
                             fontSize: 12,
                             fontWeight: FontWeight.bold,
                             color: Colors.grey[700]),
                       ),
                       overflow: TextOverflow.ellipsis,
                     ),
                   )
                 ],
               ),
             ),
             Positioned(
               right: 2,
               child:
               BlocProvider(
                 create: (_) =>AddCartBloc()..add( AddedItemCartLoadEvent()),
                  child: BlocBuilder<AddCartBloc,AddCartState>(
                       builder: (BuildContext context, AddCartState state) {

                         if(state is AddItemCartState){
                           isAddedToCart = state.addToCartList!
                               .any((item) => item.fav ==1);
                               print(" Tap addItemCartState");
                         }
                          return InkWell(
                           onTap: ()async {
                             if (isAddedToCart) {
                                BlocProvider.of<AddCartBloc>(context)
                                   .add(RemoveItemEvent(prductlistmodel));
                             } else {
                                BlocProvider.of<AddCartBloc>(context)
                                   .add(AddItemEvent(prductlistmodel));
                             }
                           },
                           child: Icon(
                             isAddedToCart
                                 ? Icons.favorite // If added to cart, filled heart
                                 : Icons.favorite_outline, // If not, outlined heart
                             color: isAddedToCart ? Colors.redAccent : Colors.black,
                           ),
                         );
                      },
                   ),
               ),
             ),
           ],
        ),
      ),
    );
  }
}
