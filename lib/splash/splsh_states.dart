import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class SplashState extends Equatable{
  const SplashState();
}
class SplashScreenIntial  extends SplashState{
  @override
   List<Object?> get props => [ ];

}
class SplashScreenLoad extends SplashState{
  @override
  List<Object?> get props => [];
}
class SplashScreenCompleted extends SplashState{
  @override

  List<Object?> get props => [];

}