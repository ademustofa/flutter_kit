import 'package:flutter/material.dart';
import 'package:flutter_application_test/provider/auth.provider.dart';
import 'package:flutter_application_test/provider/profile.provider.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final profileModel = Provider.of<ProfileProvider>(context);
    final authModel = Provider.of<AuthProvider>(context);

    return Scaffold(
      body: SafeArea(child: Column(
        children: [
          Text('is logged in ${authModel.isLoggin}'),
          Text('My Name is: ${profileModel.fullname}'),
          Text('Contact: ${profileModel.noHp}'),
          
        ],
      )),
    );
  }
}