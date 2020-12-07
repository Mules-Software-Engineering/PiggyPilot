/*
Names: Scott Grigas and Pat Smurla.
Date: 11/30/20
Software Engineering
This dart file creates the setupBank screen.
 */
//import package.dart files.
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


void main() {
  runApp(new setupBank());
}
//creates setupBank class
class setupBank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Setup Link'),
        ),
        body: new Center(
          //responds to touch
          child: new InkWell(
              child: new Text('Open Browser(Press me)'),
              //when tapped go to URl.
              onTap: () => launch('https://youtu.be/1YFwvW7zIyw')
          ),
        ),
      ),
    );
  }
}