import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  void getData() async {
    var url = Uri.parse('http://worldtimeapi.org/api/timezone/Asia/Jakarta');
    var response = await http.get(url);
    Map data = jsonDecode(response.body);
    print(data);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    print("inittial state");
    getData();
   
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Text("loading screen")),
    );
  }
}