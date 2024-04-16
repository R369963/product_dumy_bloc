
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../productlistmodel.dart';



@immutable
abstract class AddCartEvent extends Equatable{
  const AddCartEvent();
}
class AddedItemCartLoadEvent extends AddCartEvent{
  @override
  // TODO: implement props
  List<Object?> get props =>  [];

}
class AddItemEvent extends AddCartEvent{
  Prductlistmodel? prductlistmodel;
      AddItemEvent(this.prductlistmodel);
  @override
   List<Object?> get props =>  [prductlistmodel];

}
class RemoveItemEvent extends AddCartEvent{
  Prductlistmodel? prductlistmodel;
  RemoveItemEvent(this.prductlistmodel);
  @override
   List<Object?> get props => [];

}