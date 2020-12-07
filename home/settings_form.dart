/*
Names: Scott Grigas and Pat Smurla.
Date: 11/28/20
Software Engineering
This dart file creates the settings form for the home screen.
 */
//import package.dart files.
import 'package:flutter/material.dart';
import 'package:pracice/services/database.dart';
import 'package:pracice/models/user.dart';
import 'package:pracice/sharing/loading.dart';
import 'package:provider/provider.dart';

//Creates the setting form class
class SettingsForm extends StatefulWidget{
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm>{

  //Creates the state drop down options, with all the states listed in the menu
  final _formKey = GlobalKey<FormState>();
  final List<String> states = ['AL','AK','AZ','AR','CA','CO','CT','DE','FL','GA','HI','ID','IL','IN','IA','KS','KY','LA','ME','MD','MA','MI','MN','MS','MO','MT','NE','NE','NH','NJ','NM','NY','NC','ND','OH','OK','OR','PA','RI','SC','SD','TN','TX','UT','VT','VA','WA','WV','WI','WY'];

  String _currentName;
  String _currentEmail;
  String _currentPassword;
  String _currentAddress;
  String _currentCity;
  String _currentState;
  String _currentPostal;


  @override
  Widget build(BuildContext context){
  //creates the provider
    final user = Provider.of<User>(context);

    //Enables the stream builder
    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        //If the user had entered data, it will show here, if not it will show loading
        //It should always have a value but the value might sometimes be null
        if(snapshot.hasData){

          UserData userData = snapshot.data;

          return Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Text(
                      'Update your personal settings.',
                      style: TextStyle(fontSize: 15.0),
                    ),
                    SizedBox(height: 20.0),
                    //Will save the user's data once it is entered and the update button is pressed
                    //The initial value is the previous snapshot
                    TextFormField(
                      initialValue: userData.name,
                      decoration: InputDecoration(labelText: "Name"),
                      validator: (val) => val.isEmpty ? 'Please enter your name': null,
                      onChanged: (val) => setState(() => _currentName = val),
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      initialValue: userData.address,
                      decoration: InputDecoration(labelText: "Address"),
                      validator: (val) => val.isEmpty ? 'Please enter your address': null,
                      onChanged: (val) => setState(() => _currentAddress = val),
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      initialValue: userData.city,
                      decoration: InputDecoration(labelText: "City"),
                      validator: (val) => val.isEmpty ? 'Please enter your city': null,
                      onChanged: (val) => setState(() => _currentCity = val),
                    ),

                    SizedBox(height: 15.0),
                    //Creates a dropdown menu once clicked
                    DropdownButtonFormField(
                      decoration: InputDecoration(labelText: "Select State"),
                      value: _currentState ?? userData.state,
                      items: states.map((state){
                        return DropdownMenuItem(
                          value: state,
                          child: Text('$state'),
                        );
                      }).toList(),
                      onChanged: (val) => setState(() => _currentState = val),
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      initialValue: userData.postal,
                      decoration: InputDecoration(labelText: "Postal Code"),
                      validator: (val) => val.isEmpty ? 'Please enter your postal code': null,
                      onChanged: (val) => setState(() => _currentPostal = val),
                    ),

                    SizedBox(height: 20.0),
                    RaisedButton(
                      color: Colors.black,
                      child: Text(
                        'Update',
                        style: TextStyle(color: Colors.white),
                      ),
                      //Once the update button is pressed, all of the entered data will be updated in the app and the firestore
                      onPressed: () async{
                        if(_formKey.currentState.validate()){
                          await DatabaseService(uid: user.uid).updateUserData(
                            _currentName ?? userData.name,
                            _currentEmail ?? userData.email,
                            _currentPassword ?? userData.password,
                            _currentAddress ?? userData.address,
                            _currentCity ?? userData.city,
                            _currentState ?? userData.state,
                            _currentPostal ?? userData.postal,
                          );
                          //removes but saves data
                          Navigator.pop(context);
                        }
                      },
                    ),
                  ],
                ),
              ));
        }else{
            return Loading();
        }
      }
    );
  }
}

