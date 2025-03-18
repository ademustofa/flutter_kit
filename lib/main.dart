import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import 'pages/home.dart';
import 'pages/choselocation.dart';
import 'pages/loading.dart';
import 'pages/login.dart';
import 'pages/camera.dart';
import 'pages/agen/dataRegister.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Permission.camera.request();
   runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/': (context) => Loading(),
        '/camera': (context) => CameraScreen(),
        '/home': (context) => Home(),
        '/login': (context) => Login(),
        '/location': (context) => ChooseLocation(),
        '/dataRegister': (context) => DataRegister(),
      },
    ));
}
   


