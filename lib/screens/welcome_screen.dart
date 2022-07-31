import 'package:flutter/material.dart';
import 'HomePage.dart';

class WelcomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[300],
       body: SafeArea(
         child: Center(
              child: Column(

                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text("Driving License Service",style: TextStyle(color: Colors.white, fontSize: 28),),
                   ElevatedButton(
                       onPressed: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                       },
                       child: const Text("Apply for Licence",style: TextStyle(color: Colors.white),),
                       style:ElevatedButton.styleFrom(shape: const StadiumBorder()),
                   )
                ],
              ),
           ),
         ),
       );
  }
}
