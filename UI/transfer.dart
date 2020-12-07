/*
Names: Scott Grigas and Pat Smurla.
Date: 10/15/20
Software Engineering
This dart file creates the transfer screen.
 */
//import package.dart files.
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pracice/home/home.dart';
import 'package:pracice/UI/app_card.dart';

//Creates the transfer class and assigns its variables
class transfer extends StatelessWidget {

  double bal = 100.00;
  double numb;
  double res = 0.0;
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Creates the screen app bar
        appBar: AppBar(
          title: Text('Transfer Money!'),
          backgroundColor: Colors.green,
        ),
        //Creates teh page scroll view
        body: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //Creates app card
                  AppCard(
                    child: Text(
                      "Please select the user and amount of money to send.",
                      style: TextStyle(fontSize: 32.0),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  AppCard(
                      child: Container(
                          margin: EdgeInsets.only(top: 1.0),
                          child: Column(children: <Widget>[
                            TextFormField(
                              decoration: InputDecoration(
                                  labelText: "Username:"),
                            ),
                          ]))),
                  AppCard(
                      child: Container(
                          margin: EdgeInsets.only(top: 1.0),
                          child: Column(children: <Widget>[
                            //Creates a field that receives a dollar value
                            TextFormField(
                              decoration: InputDecoration(
                                  labelText: "Amount of money:"),
                              onChanged: (num) {
                                numb = double.parse(num);
                              },
                            ),
                            SizedBox(height: 10.0),
                            Container(
                                width: double.infinity,
                                margin: EdgeInsets.only(top: 10.0),
                                child: FlatButton(
                                    color: Colors.black,
                                    textColor: Colors.white,
                                    child: Text("Send"),
                                    //Creates a showed dialog UI text error
                                    onPressed: () {
                                      if (numb <= 0) {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                content: Stack(
                                                  overflow: Overflow.visible,
                                                  children: <Widget>[
                                                    //Error 0 and below
                                                    Text(
                                                      'Make sure value is positive and greater than 0.',
                                                      style: TextStyle(
                                                          color: Colors.red,
                                                          fontSize: 22.0),
                                                      textAlign: TextAlign.center,
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }
                                        );
                                      } else {
                                        if (numb > bal) {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  content: Stack(
                                                    overflow: Overflow.visible,
                                                    children: <Widget>[
                                                      //Creates error when over balance
                                                      Text(
                                                        'You have exceded your balance.',
                                                        style: TextStyle(
                                                            color: Colors.red,
                                                            fontSize: 22.0),
                                                            textAlign: TextAlign
                                                            .center,
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              }
                                          );
                                        } else {
                                          bal = bal - numb;
                                          showDialog(
                                            barrierDismissible: false,
                                              context: context,
                                              builder: (BuildContext context) {
                                                return Dialog(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(20.0)), //this right here
                                                  child: Container(
                                                    //Creates popup alert that says balance and shows a button to return to home screen
                                                    height: 200,
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(12.0),
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text('Transfer successful, your current balance is: \$$bal',
                                                              style: TextStyle(
                                                                fontSize: 27.0
                                                              ),
                                                              textAlign: TextAlign.center,
                                                          ),
                                                          SizedBox(height: 32.0),
                                                          SizedBox(
                                                            width: 320.0,
                                                            child: RaisedButton(
                                                              onPressed: () {
                                                                navigateToHome(context);
                                                              },
                                                              child: Text(
                                                                "Home Page",
                                                                style: TextStyle(
                                                                    fontSize: 16.0,
                                                                    color: Colors.white),
                                                              ),
                                                              color: const Color(0xFF1BC0C5),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              });
                                        }
                                      }
                                    }),
                            )]

                          )
                      ))
                ]
            )));
  }
}

//Creates navigation to home screen
  Future navigateToHome(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
  }