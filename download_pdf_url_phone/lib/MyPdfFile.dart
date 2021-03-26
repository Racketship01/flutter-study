

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ext_storage/ext_storage.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class MyPdf extends StatefulWidget {
  @override
  _MyPdfState createState() => _MyPdfState();
}

class _MyPdfState extends State<MyPdf> {

  // bool _isLoading=false, isInit=true;
  // PDFDocument document;

  // final imgUrl = "http://www.pdf995.com/samples/pdf";
  final imgUrl = "https://f9dc41db-5e18-4d38-a07e-99ac2b655607.filesusr.com/ugd/a12546_4746337f247e474d862e8ca007ae91eb.pdf";

  var dio = Dio();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Download Pdf File'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //
            // Expanded(child: Center(child:isInit?Text('Press button to load PDF file')
            //   : _isLoading?Center(child: CircularProgressIndicator(),)
            //     : PDFViewer(
            //       document: document,
            // ),)),
            //
            //
            
            
            
            
            
            
            
            RaisedButton.icon(
                onPressed: () async {
                  String path =
                  await ExtStorage.getExternalStoragePublicDirectory(
                      ExtStorage.DIRECTORY_DOWNLOADS);

                  String fullPath = "$path/assign.pdf";
                  download2(dio, imgUrl, fullPath);
                },
                icon: Icon(
                  Icons.file_download,
                  color: Colors.white,
                ),
                color: Colors.green,
                textColor: Colors.white,
                label: Text('Download'))
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    getPermission();
  }

  void getPermission() async {

    print("getPermission");
    await PermissionHandler().requestPermissions([PermissionGroup.storage]);
  }

  Future download2(Dio dio, String url, String savePath) async {
    try {
      Response response = await dio.get(
        url,
        onReceiveProgress: showDownloadProgress,
        //Received data with List<int>
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            validateStatus: (status) {
              return status < 500;
            }),
      );

      File file = File(savePath);
      var raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      await raf.close();
    } catch (e) {
      print('error is');
      print(e);
    }
  }
  void showDownloadProgress(received, total){
    if (total != -1) {
      print((received / total * 100).toStringAsFixed(0) + "%");
    }
  }
  }


