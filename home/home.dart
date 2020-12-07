/*
Names: Scott Grigas and Pat Smurla.
Date: 10/31/20
Software Engineering
This dart file creates the main home screen.
 */
//import package.dart files.
import 'package:flutter/material.dart';
import 'package:pracice/UI/setupBank.dart';
import 'package:pracice/home/settings_form.dart';
import 'package:pracice/screens/authenticate/sign_in.dart';
import 'package:pracice/services/auth.dart';
import 'package:pracice/UI/transfer.dart';
import 'package:pracice/UI/withdraw.dart';
import 'package:pracice/checkbal.dart';

//Creates the home class
class Home extends StatelessWidget {

  final AuthService _auth = AuthService();


  @override
  Widget build(BuildContext context) {
    //Creates a popup panel
    void _showSettingsPanel(){
      showModalBottomSheet(context: context, builder: (context){
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: SettingsForm(),
        );
      });
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome"),
        backgroundColor: Colors.green,
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Logout'),
            //Sends up a flag to notify auth.dart to logout
            onPressed: ()async{
              await _auth.signOut();
              navigateToSignIn(context);
            },
          ),
            FlatButton.icon(
              icon: Icon(Icons.settings),
              label: Text('Settings'),
              //displays panel
              onPressed: () => _showSettingsPanel(),
            )
        ],
      ),
      body: BodyLayout(),
        // UserList(

    );
  }
}
//creates BodyLayout class
class BodyLayout extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return _myListView(context);
  }
}
//create listview
Widget _myListView(BuildContext context){
  return ListView(
    children: ListTile.divideTiles(
      context: context,
      tiles:[
        //Creates the tile button for the list view
        ListTile(
            leading: Icon(Icons.compare_arrows),
            title: Text('Transfer', style: TextStyle(fontSize: 22.0),),
            subtitle: Text('Transfer money to friends!'),
            trailing: Icon(Icons.keyboard_arrow_right),
            //navigate to transfer
            onTap: () {
              navigateTotransfer(context);
            }
        ),
        Padding(
          padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
        ),
        ListTile(
            leading: Icon(Icons.account_balance),
            title: Text('Deposit', style: TextStyle(fontSize: 22.0),),
            subtitle: Text('Desposit money to your bank account!'),
            trailing: Icon(Icons.keyboard_arrow_right),
            //navigate to deposit
            onTap: () {
              navigateTowithdraw(context);
            }
        ),
        Padding(
          padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
        ),
        ListTile(
          leading: Icon(Icons.people),
          title: Text('Friends List', style: TextStyle(fontSize: 22.0),),
          subtitle: Text('Add some users to your friends list!'),
          trailing: Icon(Icons.keyboard_arrow_right),
          //navigate to friends list
          onTap: (){
            navigateTocheckbal(context);
          },
        ),
        Padding(
          padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
        ),
        ListTile(
          leading: Icon(Icons.link),
          title: Text('How to Link Bank Account', style: TextStyle(fontSize: 22.0),),
          subtitle: Text('Successfully link your bank account to transfer money!'),
          trailing: Icon(Icons.keyboard_arrow_right),
          //navigate to bank link
          onTap: () {
            navigateToBank(context);
          }
        ),
        Padding(
          padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
        ),
        ListTile(
          leading: Icon(Icons.linear_scale),
          title: Text('Link Bank Account', style: TextStyle(fontSize: 22.0),),
          subtitle: Text('Get started today!'),
          trailing: Icon(Icons.keyboard_arrow_right),
        ),
        Padding(
          padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
        ),
      ],
    ).toList(),
  );
}
//navigate to transfer
Future navigateTotransfer(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) =>
      transfer()));
}
//navigate to deposit
Future navigateTowithdraw(context) async{
  Navigator.push(context, MaterialPageRoute(builder: (context) =>
      withdraw()));
}
//navigate to checkbal
Future navigateTocheckbal(context) async{
  Navigator.push(context, MaterialPageRoute(builder: (context) =>
      CheckBal()));
}
//navigate to bankl link
Future navigateToBank(context) async{
  Navigator.push(context, MaterialPageRoute(builder: (context) =>
      setupBank()));
}
//navigate to signIn page
Future navigateToSignIn(context) async{
  Navigator.push(context, MaterialPageRoute(builder: (context) =>
      SignIn()));
}


