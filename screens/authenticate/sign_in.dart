/*
Names: Scott Grigas and Pat Smurla.
Date: 10/20/20
Software Engineering
This dart file creates the sign in screen.
 */
//import package.dart files.
import 'package:flutter/material.dart';
import 'package:pracice/UI/app_card.dart';
import 'package:pracice/home/home.dart';
import 'package:pracice/services/auth.dart';
import 'package:pracice/sharing/loading.dart';
import 'package:pracice/screens/authenticate/register.dart';

//create SignIn class
class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

//create SignIn class to connect to authenticator in firebase
class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  //create Strings to read the users input
  String email = '';
  String password = '';
  String error = '';

  @override
  //build the widget
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 100,horizontal: 20),
        child: Form(
          //group and validate form fields.
          key: _formKey,
          child: Column(
            children: <Widget>[
              //call the custom made appcard in appcard.dart
              AppCard(
          child: Text(
            "PiggyPilot",
            style: TextStyle(fontSize: 32.0),
            textAlign: TextAlign.center,
          ),
        ),
              AppCard(
                child: Container(
                margin: EdgeInsets.only(top: 10.0),
                child: Column(
                  children: <Widget>[
                //Allows user to enter data, and will check if empty then validates if correct email.
              TextFormField(
                decoration: InputDecoration(labelText: "Email"),
                validator: (val) => val.isEmpty ? 'Enter an email' : null,
                onChanged: (val){
                  setState(() => email = val);
                }
              ),
                //Checks if password is greater than 6 char, then validates correct password.
              TextFormField(
                decoration: InputDecoration(labelText: "Password"),
                //hides the users password for security.
                obscureText: true,
                validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                onChanged: (val){
                  setState(() => password = val);
                }
              ),
                //Creates button, when pressed will check if credentials are located within the firebase.
              Container(
                width: double.infinity,
                margin:EdgeInsets.only(top: 30.0),
                child:RaisedButton(
                color: Colors.black,
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white),
                ),
                //if credentials found and validated go to home page else show "error".
                onPressed: ()async{
                  if(_formKey.currentState.validate()){
                    setState(() => loading = true);
                    dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                      if(result == null){
                      setState(() {
                        error = 'Could not sign in with the given information.';
                        loading = false;
                      });
                    }else{
                        navigateToHome(context);
                      }
                  }
                },
              ))],
              ),
                )
              ),
              //Creates a row, where if there is a new user they can select the sign up button.
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Don't have an account?"),
                    //takes user to register page.
                    FlatButton(
                      onPressed: () {
                        navigateToregister(context);
                      },
                      child: Text("Sign up"),
                    )
                  ]
              ),
              SizedBox(height: 12.0),
              //Lets user know the credentials are incorrect.
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
            ],
          )
        )
      ),
    );
  }
}
//function to navigate to register page.
Future navigateToregister(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) =>
      Register()));
}
//function to navigate to home page.
Future navigateToHome(context) async{
  Navigator.push(context, MaterialPageRoute(builder: (context) =>
      Home()));
}

