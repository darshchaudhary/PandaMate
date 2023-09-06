// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:pandamate/dashboard.dart';
import 'package:pandamate/main.dart';
import 'package:zego_uikit_prebuilt_video_conference/zego_uikit_prebuilt_video_conference.dart';
import 'utils.dart';
import 'dart:math' as math;

List<String> list = ["CONFERENCE IDs","FINANCE HELP: 505", "FAMILY THERAPY: 606", "PHYSICAL ADVICE: 707"];

final String localUserID = math.Random().nextInt(10000).toString();

const String callID = "group_call_id";

void main() => runApp(JoinMeeting());

var userName = TextEditingController(text: "");

class JoinMeeting extends StatelessWidget {
  const JoinMeeting({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String dropDownValue = list.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade400,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: DropdownButton<String>(
                    value: dropDownValue,
                    icon: Icon(Icons.arrow_downward, color: Colors.teal.shade900),
                    elevation: 16,
                    dropdownColor: Colors.white,
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        dropDownValue = value!;
                      });
                    },
                    items: list.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              SizedBox(
                width: 350,
                child: TextFormField(
                  controller: userName,
                  decoration: InputDecoration(
                    labelText: "Username",
                    prefixIcon: Icon(Icons.video_call_sharp),
                    border: OutlineInputBorder(),
                    labelStyle: TextStyle(color: Colors.white,  fontSize: 20.0),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 100,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return VideoConferencePage(
                              conferenceID: "Panda Camps");
                        }));
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Colors.teal.shade900)),
                      child: Text("JOIN"),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (cpntext) => DashBoard()));
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Colors.teal.shade900)),
                      child: Text("HOME"),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class VideoConferencePage extends StatelessWidget {
  final String conferenceID;

  const VideoConferencePage({
    Key? key,
    required this.conferenceID,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZegoUIKitPrebuiltVideoConference(
        appID: Utils
            .appID, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
        appSign: Utils
            .appSign, // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
        userID: 'user_id',
        userName: userName.text,
        conferenceID: conferenceID,
        config: ZegoUIKitPrebuiltVideoConferenceConfig(),
      ),
    );
  }
}
