/*
Names: Scott Grigas and Pat Smurla.
Date: 10/1/20
Software Engineering
This dart file creates the entire the app.
 */
//import package.dart files.
import 'package:flutter/material.dart';
import 'package:pracice/models/user.dart';
import 'package:pracice/screens/wrapper.dart';
import 'package:pracice/services/auth.dart';
import 'package:provider/provider.dart';
//run myApp
void main() => runApp(MyApp());

//create myApp class
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //return Provider,authenticate, and Wrapper.
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
       home: Wrapper(),
    ));
  }
}
