import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/cubit/internet_cubit/internet_cubit.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
       body: SafeArea(
         child: Center(
           child: BlocConsumer<InternetCubit, InternetState>(
               builder: (context, state){
                  if(state == InternetState.Initial){
                    return const Text("Loading...");
                  }else if(state == InternetState.Lost){
                    return const Text("Not Connected");
                  }else{
                    return const Text("Connected");
                  }
               },

               listener: (context, state){

                 if(state == InternetState.Lost){
                   ScaffoldMessenger.of(context).showSnackBar(
                     const SnackBar(content: Text("Internet Disconnected",style: TextStyle(color: Colors.black),), backgroundColor: Colors.red,)
                   );
                 }else if(state == InternetState.Gained) {
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
