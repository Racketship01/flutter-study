

import 'package:cessna_manual_app/app/sign_in/email_sign_in_page.dart';
import 'package:cessna_manual_app/app/sign_in/sign_in_button.dart';
import 'package:cessna_manual_app/app/sign_in/social_sign_in_button.dart';
import 'package:cessna_manual_app/services/auth.dart';

import 'package:flutter/material.dart';

// import 'package:firebase_auth/firebase_auth.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key key, @required this.auth, }) : super(key: key);
  final AuthBase auth;
  // final void Function(User) onSignIn;
  // @required this.onSignIn


  Future <void> _signInAnonymously() async {
    try {
      // final user = await auth.signInAnonymously();
       await auth.signInAnonymously();
      // onSignIn(user);
    } catch (e) {
      print(e.toString());
    }

  }

  Future <void> _signInWithGoogle() async {
    try {
      // final user = await auth.signInAnonymously();
      await auth.signInWithGoogle();
      // onSignIn(user);
    } catch (e) {
      print(e.toString());
    }

  }

  Future <void> _signInWithFacebook() async {
    try {
      // final user = await auth.signInAnonymously();
      await auth.signInWithFacebook();
      // onSignIn(user);
    } catch (e) {
      print(e.toString());
    }

  }

  void _signInWithEmail(BuildContext context){
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        fullscreenDialog: true,
        builder: (context) => EmailSignInPage(auth: auth,),
      ),
    );
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Melds Tracker'),
      //   elevation: 2.0,
      // ),
      body: _buildContent(context),
      // backgroundColor: Colors.grey[200],
    );
  }

  Widget  _buildContent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            SizedBox(height: 50.0),
            Container(
              height: 150,
              child: Image(
                image: AssetImage('images/cessna_welcome.png'),
                fit: BoxFit.contain,
              ),
            ),
            RichText(
                text: TextSpan(
                    text: 'Welcome to ',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Cessna-152 Handbook',
                          style: TextStyle(
                              fontSize: 23.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black))
                    ])),
            Text(
              ' Manual Operation Procedure Application',
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 70.0,),


            Column(

              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  '',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),



                SocialSignInButton(
                  assetName: 'images/google-logo.png',
                  text: 'Sign in with Google',
                  textColor: Colors.black87,
                  color: Colors.white,
                  onPressed: _signInWithGoogle,
                ),
                SizedBox(height: 8.0),
                SocialSignInButton(
                  assetName: 'images/facebook-logo.jpg',
                  text: 'Sign in with Facebook',
                  textColor: Colors.white,
                  color: Color(0xFF334092),
                  onPressed: _signInWithFacebook,
                  // onPressed: () {},
                ),
                SizedBox(height: 8.0),
                SignInButton(
                  text: 'Sign in with email',
                  textColor: Colors.white,
                  color: Colors.teal[700],
                  onPressed: () => _signInWithEmail(context),
                ),
                Text(
                  'or',
                  style: TextStyle(fontSize: 14.0, color: Colors.black87),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8.0),
                SignInButton(
                  text: 'Go anonymous',
                  textColor: Colors.black,
                  color: Colors.lime[300],
                  onPressed: _signInAnonymously,
                ),

              ],
            ),
          ]
      ),
    );
  }
}




