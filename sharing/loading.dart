/*
Names: Scott Grigas and Pat Smurla.
Date: 11/30/20
Software Engineering
This dart file creates the loading screen animation.
 */
//import package.dart files.
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

//Creates teh loading class
class Loading extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      color: Colors.brown[100],
      //imports the flutter spinkit which is the loading animation
      child: Center(
        child: SpinKitChasingDots(
          color: Colors.white,
          size: 50.0,
        )
      ),
    );
  }
}