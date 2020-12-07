/*
Names: Scott Grigas and Pat Smurla.
Date: 11/11/20
Software Engineering
This dart file creates the custom UI appcard.
 */
//import package.dart files.
import 'package:flutter/material.dart';
//Creates the app card class
class AppCard extends StatefulWidget{
  final Widget child;
  final Border borderStyle;
  final Color boxShadowColor;
  AppCard({@required this.child, this.borderStyle, this.boxShadowColor});
  @override
  _AppCard createState() => new _AppCard();
}

class _AppCard extends State<AppCard>{
  @override
  Widget build(BuildContext context){
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        //Creates a new card with set attributes
        new Card(
          margin: EdgeInsets.all(20.0),
          color: Colors.white,
          child: new Container(
            padding: EdgeInsets.all(20.0),
            child: widget.child,
            decoration: new BoxDecoration(
              color: Colors.white,
              border: widget.borderStyle ??
                  Border.all(
                    color: Colors.black,
                    width: 2,
                  ),
              //Cards shadow
              boxShadow: [
                new BoxShadow(
                  color: widget.boxShadowColor ?? Colors.black,
                  offset: new Offset(10.0, 10.0),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}