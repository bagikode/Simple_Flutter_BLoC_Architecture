import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterskeleton/bloc/home/home_blocs.dart';
import 'package:flutterskeleton/helper/connectivity/offline_builder.dart';
import 'package:flutterskeleton/services/repository/home_repository.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  HomeBloc homeBloc;
  HomeRepository homeRepository;

  @override
  void initState() {
    super.initState();
    homeRepository = HomeRepository();
    homeBloc = HomeBloc(homeRepository: homeRepository);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Screen'),),
      body: Container(
        child:  BlocBuilder<HomeBloc, HomeState>(
            bloc: homeBloc,
            builder: (context, state){
              if(state is InitialHomeState){
               homeBloc.add(LoadHome());
              }
              if(state is HomeLoaded){
                return OfflineBuilder(
                  connectivityBuilder:
                      (context, connectivity, child) {
                    if (connectivity == ConnectivityResult.none) {
                      print('Not Connected');
                      return Container(
                          child: ListView(
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.all(0.0),
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(top: 5.0),
                                child: RaisedButton(
                                    color: Colors.blue,
                                    child: Text(
                                      'Refresh',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () {
                                      setState(() {

                                      });
                                    }),
                              ),
                            ],
                          ),
                        );
                    } else {
                      return child;
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                      child:  ListView(
                        children: <Widget>[
                          Text('${state.homeModel[0].title}'),
                        ],
                      )
                    ),
                );
              }
              if(state is HomeLoading){
                return Center(
                  child:  CircularProgressIndicator(),
                );
              }
              if(state is HomeError){
                return Center(
                  child: Text('${state.message}'),
                );
              }
             return Center(
                child: Text('Gagal Mendapatkan Data!'),
              );
            }

        )
      ),
    );
  }
}
