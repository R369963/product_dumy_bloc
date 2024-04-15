import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:proife/productlistmodel.dart';

class ProductCard extends StatelessWidget {
  Prductlistmodel prductlistmodel;

  ProductCard({required this.prductlistmodel});

  @override
  Widget build(BuildContext context) {
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
                       "\u{20B9} ${prductlistmodel.price}",
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
               child: InkWell(
                 onTap: () {

                 },
                   child:addCart ==true? const Icon(Icons.favorite_outline,color: Colors.black,):const  Icon(Icons.favorite,color: Colors.redAccent,)),
             ),
           ],
        ),
      ),
    );
  }
}
