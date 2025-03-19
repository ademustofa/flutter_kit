import 'package:camera/camera.dart';
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


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProfileProvider()),
        ChangeNotifierProvider(create: (context) => AuthProvider()),
      ],
      child: MyApp(cameras: cameras),
    ),
  );
}

class MyApp extends StatelessWidget {
  final List<CameraDescription> cameras;

  MyApp({required this.cameras});
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/camera',
      routes: {
        '/': (context) => Loading(),
        '/camera': (context) => CameraScreen(cameras: cameras),
        '/home': (context) => Home(),
        '/login': (context) => Login(),
        '/location': (context) => ChooseLocation(),
        '/dataRegister': (context) => DataRegister(),
      },
    );
  }
}

   


