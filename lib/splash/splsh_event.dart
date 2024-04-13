
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class SplashEvent extends Equatable{
const SplashEvent();
}
class SplashScreenLoadEvent extends SplashEvent{
  @override

  List<Object?> get props => [];

}