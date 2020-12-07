/*
Names: Scott Grigas and Pat Smurla.
Date: 11/16/20
Software Engineering
This dart file creates the user_lists for the Firebase.
 */
//import package.dart files.
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

//create UserList class
class UserList extends StatefulWidget{
  @override
  _UserListState createState() => _UserListState();
}
//create UserListState class
class _UserListState extends State<UserList>{
  @override
  Widget build(BuildContext context){

    //provides snapshot
    final users = Provider.of<QuerySnapshot>(context);

    //print(users.documents);
    for(var doc in users.documents){
      print(doc.data);
    }
    return Container(
    );
  }
}



