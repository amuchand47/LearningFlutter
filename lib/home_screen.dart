import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/bloc/internet_bloc/internet_bloc.dart';
import 'package:learning/bloc/internet_bloc/internet_event.dart';
import 'package:learning/bloc/internet_bloc/internet_state.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
       body: SafeArea(
         child: Center(
           child: BlocConsumer<InternetBloc, InternetState>(
               builder: (context, state){
                  if(state is InternetInitialState){
                    return const Text("Loading...");
                  }else if(state is InternetLostState){
                    return const Text("Not Connected");
                  }else{
                    return const Text("Connected");
                  }
               },

               listener: (context, state){

                 if(state is InternetLostState){
                   ScaffoldMessenger.of(context).showSnackBar(
                     const SnackBar(content: Text("Internet Disconnected",style: TextStyle(color: Colors.black),), backgroundColor: Colors.red,)
                   );
                 }else if(state is InternetGainedState) {
                   ScaffoldMessenger.of(context).showSnackBar(
                       const SnackBar(content: Text("Internet Connected"), backgroundColor: Colors.green,)
                   );
                 }

               },
               ),
           ),
         ),
       );
  }
}
