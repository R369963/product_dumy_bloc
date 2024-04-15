import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:proife/addcart/addcart_model.dart';

@immutable
abstract class AddCartState extends Equatable{
  const AddCartState();
}
class AddCartLoading extends AddCartState{
  @override
   List<Object?> get props => [];

}
class AddItemCartState extends AddCartState{
  List<AddItemCart> addToCartList = [];

  @override
   List<Object?> get props =>  [addToCartList];
}
class GetCartItems extends AddCartState{
  List<AddItemCart> getCartItems = [];
  GetCartItems({
    required this.getCartItems
});
  @override
   List<Object?> get props => [getCartItems];
  }
class RemoveItemCartState extends AddCartState{
  List<AddItemCart> removeToCart = [];
  RemoveItemCartState({required this.removeToCart});
  @override
  List<Object?> get props =>  [removeToCart];
}