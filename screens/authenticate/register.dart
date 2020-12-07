/*
Names: Scott Grigas and Pat Smurla.
Date: 10/25/20
Software Engineering
This dart file creates the register screen.
 */
//import package.dart files.
import 'package:flutter/material.dart';
import 'package:pracice/screens/authenticate/sign_in.dart';
import 'package:pracice/services/auth.dart';
import 'package:pracice/UI/app_card.dart';

//creates register class
class Register extends StatefulWidget {

  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}
//creates register state class. connects to firebase.
class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  //bool loading = false;

  String email = '';
  String password = '';
  String error = '';

//creates widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //creates appbar for top screen.
      appBar: AppBar(
        title: Text('Sign Up'),
        backgroundColor: Colors.green,
      ),
      //creates a scroll view.
      body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 100, horizontal: 20),
          child: Form(
            //group and validate form fields.
              key: _formKey,
              child: Column(
                children: <Widget>[
                  //creates custom app card from appcard.dart
                  AppCard(
                    child: Container(
                    margin: EdgeInsets.only(top:10.0),
                    child: Column(
                      children: <Widget>[
                      //allows user to enter data, checks to see if email is valid.
                    TextFormField(
                      decoration: InputDecoration(labelText: "Email"),
                      validator: (val) => val.isEmpty ? 'Enter an email' : null,
                      onChanged: (val) {
                        setState(() => email = val);
                      }
                  ),
                  SizedBox(
                    height: 35.0,
                  ),
                    //allows user to enter data, checks to see if password is longer than 6 chars.
                  TextFormField(
                      decoration: InputDecoration(labelText: "Password"),
                      validator: (val) =>
                      val.length < 6 ? 'Enter a password 6+ chars long' : null,
                      //black dots covers password.
                      obscureText: true,
                      onChanged: (val) {
                        setState(() => password = val);
                      }
                  ),
                  SizedBox(
                    height: 35.0,
                  ),
                  Container(
                    width: double.infinity,
                    margin:EdgeInsets.only(top: 30.0),
                  child: RaisedButton(
                    color: Colors.black,
                    child: Text(
                      'Register',
                      style: TextStyle(color: Colors.white),
                    ),
                    //when pressed, key validates info then creates data in firebase.
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        //setState(() => loading = true);
                        dynamic result = await _auth
                            .registerWithEmailAndPassword(email, password);
                        //if null print error, else go to signIn screen.
                        if (result == null) {
                          setState(() {
                            error = 'Please supply a valid email.';
                            //loading = false;
                          });
                        }else{
                          navigateToSignIn(context);
                        }
                      }
                    },
                  )),
                  ]))),
                  SizedBox(height: 12.0),
                  Text(
                    //set error style
                    error,
                    style: TextStyle(color: Colors.red, fontSize: 14.0),
                  )
                    ],
              )
          )
      ),
    );
  }
}
//navigate to SignIn screen.
Future navigateToSignIn(context) async{
  Navigator.push(context, MaterialPageRoute(builder: (context) =>
      SignIn()));
}