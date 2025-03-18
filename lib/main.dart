import 'package:flutter/material.dart';
import 'package:flutter_application_test/provider/auth.provider.dart';
import 'package:flutter_application_test/provider/profile.provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import 'pages/home.dart';
import 'pages/choselocation.dart';
import 'pages/loading.dart';
import 'pages/login.dart';
import 'pages/camera.dart';
import 'pages/agen/dataRegister.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProfileProvider()),
        ChangeNotifierProvider(create: (context) => AuthProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
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
    );
  }
}

   


