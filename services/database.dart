/*
Names: Scott Grigas and Pat Smurla.
Date: 11/21/20
Software Engineering
This dart file creates the database.
 */
//import package.dart files.
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pracice/models/user.dart';
//creates the Database service
class DatabaseService {

  final String uid;

  DatabaseService({this.uid});

  //collection reference
  final CollectionReference userInfo = Firestore.instance.collection('users');

  //updates user data when called
  Future updateUserData(String name, String email, String password,
      String address, String city, String state, String postal) async {
    return await userInfo.document(uid).setData({
      'name': name,
      'email': email,
      'password': password,
      'address': address,
      'city': city,
      'state': state,
      'postal': postal,
    });
  }
//returns userData snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      email: snapshot.data['email'],
      password: snapshot.data['password'],
      address: snapshot.data['address'],
      city: snapshot.data['city'],
      state: snapshot.data['state'],
      postal: snapshot.data['postal'],
    );
  }
//creates stream and inserts snapshotData.
 Stream<QuerySnapshot> get users{
    return userInfo.snapshots();
  }


//Stream gets userData.
  Stream<UserData> get userData{
    return userInfo.document(uid).snapshots()
    .map(_userDataFromSnapshot);
  }
}


