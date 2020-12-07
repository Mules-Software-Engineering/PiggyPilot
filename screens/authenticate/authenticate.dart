/*
Names: Scott Grigas and Pat Smurla.
Date: 10/29/20
Software Engineering
This dart file creates the authentication page when the app is starting.
 */
//import package.dart files.
import 'package:flutter/material.dart';
import 'package:pracice/screens/authenticate/register.dart';
import 'package:pracice/screens/authenticate/sign_in.dart';

//create Authenticate class
class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

//create AuthenticateState
class _AuthenticateState extends State<Authenticate> {

  bool showSignIn = true;
  void toggleView(){
    setState(() => showSignIn = !showSignIn);
  }
@override
Widget build(BuildContext context){
    //when started show the signIn screen
  if(showSignIn){
    return SignIn(toggleView: toggleView);
    //else show register.
  }else{
    return Register(toggleView: toggleView);
  }
}
}

