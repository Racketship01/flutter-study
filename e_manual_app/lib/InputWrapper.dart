import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Button.dart';
import 'InputField.dart';



class InputWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(30),
    child: Column(
      children: <Widget> [
        SizedBox(height: 40.0,),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0)
          ),
          child: InputField(
          )
        ),
        SizedBox(height: 10.0,),

        Text(
          'Forgot Password?',  textAlign: TextAlign.left,
          style: TextStyle(color: Colors.grey),
        ),
        SizedBox(height: 100.0,),
        Text(
          'No Account yet?', style: TextStyle(color: Colors.grey),

        ),

        FlatButton(
          child: Text('Sign up',
              style: TextStyle(fontSize: 18.0, color: Colors.grey)),
          onPressed: () {},
        ),

        SizedBox(height: 20.0,),
        Button()
      ],

    ),
    );
  }
}
