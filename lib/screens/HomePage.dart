import 'package:flutter/material.dart';
import 'package:learning/provider/home_page_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: SafeArea(

        child: Container(

          padding: const EdgeInsets.all(20.0),

          child : ChangeNotifierProvider<HomePageProvider>(

            create: (context)=> HomePageProvider(),

            child: Consumer<HomePageProvider>(

              builder: (context, provider, child){

                return Column(

                  children:  [

                      TextField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: "Enter your age"
                        ),

                       onChanged: (value){
                        provider.checkEligibility(value.isNotEmpty?int.parse(value):0);
                       },
                      ),
                      const SizedBox(height: 20,),
                      Text(provider.eligibilityMessage.toString(), style: TextStyle(color: (provider.isEligible==true)?Colors.green:Colors.red),)
                  ],
                );
              },

            )
          )
        ),
      ),
    );
  }
}

