import 'package:flutter/material.dart';

void main() =>
    runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: Home()));

// 0xFF007B43

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int ninjalevel = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Ninja ID Card', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/souma.jpeg"),
                radius: 40.0,
              ),
            ),
            Divider(
              height: 60.0,
              color: Color.fromARGB(255, 66, 66, 66),
            ),
            Text(
              "NAME",
              style: TextStyle(color: Colors.grey, letterSpacing: 2.0),
            ),
            SizedBox(height: 5),
            Text(
              "Ryu Goto",
              style: TextStyle(
                  color: Colors.amber,
                  letterSpacing: 2.0,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold),
            ),
             SizedBox(height: 30),
            Text(
              "Current Ninja Level",
              style: TextStyle(color: Colors.grey, letterSpacing: 2.0),
            ),
            SizedBox(height: 5),
            Text(
              '$ninjalevel',
              style: TextStyle(
                  color: Colors.amber,
                  letterSpacing: 2.0,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Icon(
                  Icons.email,
                  color: Color.fromARGB(255, 158, 158, 158)
                ),
                SizedBox(width: 10),
                Text(
                "souma.yukihira@gmail.com",
                style: TextStyle(
                    color: Color.fromARGB(255, 158, 158, 158),
                    letterSpacing: 1.0,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold),
              ),
              ]
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey.shade800,
        shape: CircleBorder(),
        onPressed: () {
          setState(() {
            ninjalevel += 1;
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
