/*
Names: Scott Grigas and Pat Smurla.
Date: 11/19/20
Software Engineering
This dart file creates the wrapper.
 */
//import package.dart files.
import 'package:pracice/home/home.dart';
import 'package:pracice/models/user.dart';
import 'package:pracice/screens/authenticate/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//create wrapper class
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //provides user data
    final user = Provider.of<User>(context);

    //checks if user entered correct information.
    if(user == null){
      return Authenticate();
    }else{
      return Home();
    }
  }
}