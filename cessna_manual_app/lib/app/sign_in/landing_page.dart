


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cessna_manual_app/app/sign_in/home_page.dart';
import 'package:cessna_manual_app/app/sign_in/sign_in_page.dart';
import 'package:cessna_manual_app/services/auth.dart';

import 'home_page.dart';


class LandingPage extends StatelessWidget {
  const LandingPage({Key key, @required this.auth}) : super(key: key);
  final AuthBase auth;




//   @override
//   _LandingPageState createState() => _LandingPageState();
// }
//
// class _LandingPageState extends State<LandingPage> {
//


  // User _user;
  // @override
  // void initState() {
  //   super.initState();
  //   // widget.auth.authStateChanges().listen((user) {
  //   //   print('uid: ${user?.uid}');
  //   // });
  //   _updateUser(widget.auth.currentUser);
  //
  // }
  //
  //
  // void _updateUser(User user) {
  //   // print('User id: ${user.uid}');
  //   setState(() {
  //     _user = user;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User> (
        stream: auth.authStateChanges(),
        builder: (context, snapshot){
          if (snapshot.connectionState == ConnectionState.active){
            final User user = snapshot.data;
            if (user == null) {
              return SignInPage(
                auth: auth,
                // onSignIn:  _updateUser,
              );
            }
            return HomePage(
              auth: auth,
              // onSignOut: () => _updateUser(null),
            );
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
    );

  }
}

