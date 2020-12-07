/*
Names: Scott Grigas and Pat Smurla.
Date: 11/20/20
Software Engineering
This dart file creates the User classes.
 */
//import package.dart files.
class User{

  //finds the users UID
  final String uid;

  //Sets the user's info to what is saved in the firestore
  User({this.uid, name, email, password, address, city, state, postal});
}

//Creates the User's class and assigns it's values
class UserData{
  final String uid;
  final String name;
  final String email;
  final String password;
  final String address;
  final String city;
  final String state;
  final String postal;

  UserData({this.uid,this.name,this.email,this.password,this.address,this.city,this.state,this.postal});
}

