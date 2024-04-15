
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'addcart_model.dart';

@immutable
abstract class AddCartEvent extends Equatable{
  const AddCartEvent();
}

class AddItemEvent extends AddCartEvent{
   AddItemCart? addItem;
    AddItemEvent(addItem);
  @override
   List<Object?> get props =>  [addItem];

}
class RemoveItemEvent extends AddCartEvent{
  AddItemCart? addItemCart;
  RemoveItemEvent(addItem);
  @override
   List<Object?> get props => [addItemCart];

}