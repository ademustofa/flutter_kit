import 'package:flutter/material.dart';
import 'package:flutter_application_test/provider/auth.provider.dart';
import 'package:flutter_application_test/provider/profile.provider.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _controller = TextEditingController();
  String phoneNumber = '';

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        phoneNumber =
            _controller.text; // Update the state when the text changes
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the controller
    super.dispose();
  }

  void handleLogin() {
    final authModel = Provider.of<AuthProvider>(context, listen: false);
    final profileModel = Provider.of<ProfileProvider>(context, listen: false);
    authModel.setIsLogged();
    profileModel.setProfiles();

    // Navigate to the second screen
    Navigator.pushNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    // var btnSmall = MediaQuery.of(context).size.height / 20;
    var btnNormal = MediaQuery.of(context).size.height / 18;

    // var btnLarge = MediaQuery.of(context).size.height / 16;
    return Scaffold(
        body: Stack(children: [
      Column(children: <Widget>[
        Flexible(
            flex: 2,
            child: Container(
              color: Color(0xFF007B43),
              child: Center(
                  child: Image.asset(
                "assets/haralogin.png",
                width: 100.0,
                height: 100.0,
              )),
            )),
        Flexible(
            flex: 3,
            child: Container(
              color: Colors.grey.shade300,
            )),
      ]),
      Align(
        alignment: Alignment(0, 0.2),
        child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            margin: EdgeInsets.all(20.0),
            padding: EdgeInsets.all(30.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Masuk",
                    style: TextStyle(
                        letterSpacing: 0.3,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 10.0),
                Text("Masukan nomor telpon anda untuk melanjutkan",
                    style: TextStyle(letterSpacing: 0.3)),
                SizedBox(height: 20.0),
                Text("Nomor Telepon",
                    style: TextStyle(
                        letterSpacing: 0.3, fontWeight: FontWeight.w600)),
                SizedBox(height: 10.0),
                SizedBox(
                    height: 50.0,
                    child: TextField(
                      controller: _controller,
                      onChanged: (text) {
                        setState(() {
                          phoneNumber = text;
                        });
                      },
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                          fontSize: 14.0, fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFF007B43), width: 1.0),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          border: OutlineInputBorder()),
                    )),
                SizedBox(height: 20.0),
                Container(
                  height: btnNormal,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Color(0xFF007B43)),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)))),
                    onPressed: handleLogin,
                    child: Text(
                      'Masuk',
                      style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 1,
                          fontSize: 15.0),
                    ),
                  ),
                ),
                SizedBox(height: 50.0),
                Align(
                  alignment: Alignment.center,
                  child: Text("Belum Punya Akun?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.grey.shade800,
                          letterSpacing: 1,
                          fontSize: 15.0)),
                ),
                SizedBox(height: 10.0),
                Container(
                  height: btnNormal,
                  width: double.infinity,
                  child: OutlinedButton(
                    style: ButtonStyle(
                        // backgroundColor:
                        //     MaterialStatePropertyAll(Color(0xFF007B43)),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)))),
                    onPressed: () {
                      // Add your onPressed logic here
                      Navigator.pushNamed(context, '/dataRegister');
                    },
                    child: Text(
                      'Daftar Disini',
                      style: TextStyle(
                          color: Colors.grey.shade800,
                          letterSpacing: 1,
                          fontSize: 15.0),
                    ),
                  ),
                )
              ],
            )),
      )
    ]));
  }
}
