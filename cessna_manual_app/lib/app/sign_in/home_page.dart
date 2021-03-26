import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cessna_manual_app/services/auth.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key, @required this.auth, }) : super(key: key);
  final AuthBase auth;
  // final VoidCallback onSignOut;
  // @required this.onSignOut


  Future <void> _signOut() async {
    try {
      await auth.signOut();
      // onSignOut();

    } catch (e) {
      print(e.toString());
    }

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          FlatButton(
            child: Text('Log out',
                style: TextStyle(fontSize: 18.0, color: Colors.white)),
            onPressed: _signOut,
          ),
        ],
      ),
    );
  }
}
