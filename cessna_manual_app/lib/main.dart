// import 'package:/cessna_manual_app/lib/app/sign_in/Login.dart';
import 'package:cessna_manual_app/app/sign_in/landing_page.dart';
// import 'package:cessna_manual_app/app/sign_in/sign_in_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cessna_manual_app/services/auth.dart';
// import 'package:firebase_auth/firebase_auth.dart';




Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());

}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.cyan[800],

        ),
      // debugShowCheckedModeBanner: false,
      home: LandingPage(
        auth: Auth(),
      ),

      // routes: <String, WidgetBuilder>{
      //     'Login' : (BuildContext context) =>Login(),
      //
      // },

    );
  }
}

