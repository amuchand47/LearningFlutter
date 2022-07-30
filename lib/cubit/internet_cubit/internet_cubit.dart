
import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum InternetState { Initial, Lost, Gained }

class InternetCubit extends Cubit<InternetState> {

  Connectivity connectivity = Connectivity();
  StreamSubscription? connectivitySubscription;

  InternetCubit() : super(InternetState.Initial){

    connectivitySubscription =  connectivity.onConnectivityChanged.listen((result) {

        if(result==ConnectivityResult.wifi || result==ConnectivityResult.mobile){
          emit(InternetState.Gained);
        }else{
          emit(InternetState.Lost);
        }

    });
  }

  @override
  Future<void> close() {
    // TODO: implement close
    connectivitySubscription?.cancel();
    return super.close();
  }


}