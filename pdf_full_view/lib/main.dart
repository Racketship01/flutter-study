import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pdf_full_view/home_page.dart';
import 'package:pdf_full_view/pdf_page.dart';
import 'package:path_provider/path_provider.dart';

import 'home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  // This moves the PDF file from the assets to a place accessible by our PDF viewer.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("PDF Viewer"),
        ),
        body: HomePage(context),
      ),
    );
  }
}