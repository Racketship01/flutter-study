import 'package:flutter/material.dart';

class Button extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Container(
     height: 50.0,
     margin: EdgeInsets.symmetric(horizontal: 50.0),
     decoration: BoxDecoration(
       color: Colors.cyan[500],
       borderRadius:BorderRadius.circular(10.0),
     ),
     child: Center(
       child: Text('Log in', style: TextStyle(
         color: Colors.white,
         fontSize: 15,
         fontWeight: FontWeight.bold
       ),),
     ),
   );
  }
}