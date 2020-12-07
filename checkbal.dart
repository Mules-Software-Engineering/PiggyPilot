/*
Names: Scott Grigas and Pat Smurla.
Date: 12/2/20
Software Engineering
This dart file creates the screen within friends list.
 */
//import package.dart files.
import 'package:flutter/material.dart';
import 'package:pracice/UI/app_card.dart';

//Creates the checkbal class
class CheckBal extends StatelessWidget{

  double bal = 100.00;
@override
Widget build(BuildContext context){
return Scaffold(
  //Creates custom app bar
appBar: AppBar(
  title: Text('Friends'),
  backgroundColor: Colors.green,
),
body: Container(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      //Creates the app card
      AppCard(
        child: Text(
        "This feature will be for the future. Not enough time!",
        style: TextStyle(fontSize: 22.0),
        textAlign: TextAlign.center,
  )
)
  ]
)
));
}
}