import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:proife/productlistmodel.dart';

@immutable
abstract class UserState extends Equatable{}

class UserLoadingState extends UserState{
  @override
  List<Object> get props => [];
}
class UserLoadState extends UserState{
     List<Prductlistmodel>? products;

  @override
   List<Object?> get props =>  [products];

}
class UserErrorState extends UserState{
 String? error;
 UserErrorState(this.error);
  @override
  List<Object?> get props => [error];
}