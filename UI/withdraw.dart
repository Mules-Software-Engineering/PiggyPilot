/*
Names: Scott Grigas and Pat Smurla.
Date: 11/12/20
Software Engineering
This dart file creates the deposit screen.
 */
//import package.dart files.
import 'package:flutter/material.dart';
import 'package:pracice/UI/app_card.dart';
import 'package:pracice/home/home.dart';

//Creates withdraw class
class withdraw extends StatelessWidget {
  double bal = 100;
  double numb;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Creates the pages app bar
        appBar: AppBar(
          title: Text('Deposit'),
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                //Creates app card
                AppCard(
                child: Text(
                  "Please enter the amount of money you would like to deposit to your bank.",
                  style: TextStyle(fontSize: 32.0),
                  textAlign: TextAlign.center,
                ),
              ),
              AppCard(
                  child: Text(
                "Balance: \$$bal",
                style: TextStyle(fontSize: 30.0),
                textAlign: TextAlign.center,
              )),
              AppCard(
                  child: Container(
                margin: EdgeInsets.only(top: 10.0),
                child: Column(children: <Widget>[
                  //Creates a field that saves what is entered
                  TextFormField(
                    decoration: InputDecoration(labelText: "Amount"),
                    onChanged: (num) {
                      numb = double.parse(num);
                    },
                  ),
                  Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 10.0),
                      child: FlatButton(
                          color: Colors.black,
                          textColor: Colors.white,
                          child: Text("Confirm"),
                          onPressed: () {
                            //Creates a popup for error 0 and below
                            if (numb <= 0) {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      content: Stack(
                                        overflow: Overflow.visible,
                                        children: <Widget>[
                                          Text(
                                            'Make sure you are depositing a value greater than 0.',
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 22.0),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    );
                                  });
                            } else {
                              //Creates a popup error that exceeds your balance
                              if (numb > bal) {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        content: Stack(
                                          overflow: Overflow.visible,
                                          children: <Widget>[
                                            Text(
                                              'You are trying to deposit an amount larger than your balance.',
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 22.0),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      );
                                    });
                              } else {
                                //Creates a popup that shows updated balance in app after deposit and a button to the home screen
                                bal = bal - numb;
                                showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Dialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0)),
                                        //this right here
                                        child: Container(
                                          height: 200,
                                          child: Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Deposit successful, your current in-app balance is: \$$bal',
                                                  style:
                                                      TextStyle(fontSize: 27.0),
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
                                                    color: Colors.black,
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
                          }))
                ]),
              ))
            ])));
  }
}
//Navigate to home screen
Future navigateToHome(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
}
