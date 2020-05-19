import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutterskeleton/models/home_model.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}


class InitialHomeState extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoading extends HomeState {


  @override
  // TODO: implement props
  List<Object> get props => [];
}

class HomeLoaded extends HomeState {
  final List<HomeModel> homeModel;

  HomeLoaded({@required this.homeModel});

  @override
  List<Object> get props => [homeModel];
}

class HomeError extends  HomeState {
  String message;
  HomeError({@required this.message});

  @override
  List<Object> get props => [message];

}
