import 'package:flutter/material.dart';


class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("hello world");
  }

  @override
  Widget build(BuildContext context) {
     print("hello world from bruild");
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text("Choose a Location", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        elevation: 0,
      ),
      body: Text("choose location"),
    );
  }
}