//ignore_for_file:prefer_const_constructors
import 'package:flutter/material.dart';
import 'dashboard.dart';

void main() => runApp(AvatarPage());

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('COLLABORATORS'),
          leading: IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => DashBoard()));
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              )
          ),
        ),
        body: AvatarColumn(),
      ),
    );
  }
}

class AvatarColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.blue, Colors.teal],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 60.0,
              backgroundImage: AssetImage('images/panda1.png'),
              backgroundColor: Colors.transparent,
            ),
            SizedBox(height: 10.0),
            Text(
              'Rishabh Jain',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 30.0),
            CircleAvatar(
              radius: 60.0,
              backgroundImage: AssetImage('images/panda2.png'),
              backgroundColor: Colors.transparent,
            ),
            SizedBox(height: 10.0),
            Text(
              'Darsh Chaudhary',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 30.0),
            CircleAvatar(
              radius: 60.0,
              backgroundImage: AssetImage('images/panda3.png'),
              backgroundColor: Colors.transparent,
            ),
            SizedBox(height: 10.0),
            Text(
              'Nakshaktra Bhandari',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
