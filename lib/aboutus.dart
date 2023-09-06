import 'package:flutter/material.dart';
import 'dashboard.dart';

void main() {
  runApp(AboutUsPage());
}

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal.shade700,
          title: Text(
            'About Us',
            style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => DashBoard()));
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.teal.shade900,
        body: AboutUsContent(),
      ),
    );
  }
}

class AboutUsContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 150,
            width: 150,
            child: Image.asset('images/hanging_panda.png'),
          ),
          SizedBox(height: 10.0),
          Text(
            'PandaMate is an all-age pandemic recovery app, fostering hope and connection. Featuring AI integration, it offers a mystical experience centered around friendly pandas, creating a sense of generosity and distraction from hardships. Our app includes Pinboard, Meditation, ChatBot, Games, Tropical Rooms, Panda Camps, and Bamboo Points for a holistic approach to healing. With a user-friendly interface, we aim to make navigation effortless.',
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.white70,
            ),
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: 30.0),
          Container(
            decoration: BoxDecoration(
              color: Colors.teal.shade700,
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Join us in the journey of recovery and well-being!',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
