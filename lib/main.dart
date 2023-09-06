//ignore_for_file:prefer_const_constructors
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pandamate/dashboard.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(PandaMate());

class PandaMate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PandaMate',
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: SplashScreen(),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Wait for 5 seconds and navigate to the next screen
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DashBoard()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
      Colors.teal.shade400, // Customize your splash screen background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 130,
              height: 130,
              child: Image(
                image: AssetImage('images/pandamate_logo.png'),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('PandaMate',
                  style: GoogleFonts.calistoga(
                    color: Colors.black,
                    fontSize: 50,
                    fontWeight: FontWeight.w800,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
