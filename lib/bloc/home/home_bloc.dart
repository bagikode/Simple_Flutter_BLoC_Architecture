import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterskeleton/models/home_model.dart';
import 'package:flutterskeleton/services/repository/home_repository.dart';
import './home_blocs.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  static String tag = "HomeBloc";

  final HomeRepository homeRepository;

  HomeBloc({@required this.homeRepository});

  @override
  HomeState get initialState => InitialHomeState();

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if(event is LoadHome){
      yield HomeLoading();
      try {
        print('kesini yaa');
        final List<HomeModel> response = await homeRepository.postHome();
        print(response);
        if (response[0].title!= null) {
          yield HomeLoaded(homeModel: response);
        }
      } on Exception catch (err) {
        yield HomeError(message: err.toString());
      }
    }
  }
}
