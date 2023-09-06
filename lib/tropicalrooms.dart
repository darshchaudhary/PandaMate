import 'package:flutter/material.dart';
import 'package:pandamate/dashboard.dart';
import 'package:pandamate/main.dart';
import 'package:zego_uikit_prebuilt_video_conference/zego_uikit_prebuilt_video_conference.dart';
import 'utils.dart';
import 'dart:math' as math;
import 'package:google_fonts/google_fonts.dart';

var conferenceDTextCtrl = TextEditingController(text: "");


class TropicalRooms extends StatelessWidget {
  const TropicalRooms({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xFF7091A4),
          appBar: AppBar(
            title: Text(
              'Tropical Rooms',
              style: GoogleFonts.calistoga(
                fontSize: 30.0
              ),
            ),
            leading: IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DashBoard()));
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                )
            ),
            backgroundColor: Colors.teal.shade900
          ),
          body: Rooms(),
        ),
      ),
    );
  }
}

class Rooms extends StatefulWidget {
  const Rooms({super.key});

  @override
  State<Rooms> createState() => _RoomsState();
}

class _RoomsState extends State<Rooms> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableRoom(
                    roomName: 'STUDY ROOM',
                    onlinePeople: 76,
                  ),
                ),
                Expanded(
                  child: ReusableRoom(
                    roomName: 'DISCUSSION ROOM',
                    onlinePeople: 41,
                  ),
                )
              ],
            )
        ),
        Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableRoom(
                    roomName: 'EXERCISE ROOM',
                    onlinePeople: 102,
                  ),
                ),
                Expanded(
                  child: ReusableRoom(
                    roomName: 'COMEDY ROOM',
                    onlinePeople: 24,
                  ),
                )
              ],
            )
        )
      ],
    );
  }
}

class ReusableRoom extends StatelessWidget {

  final int onlinePeople;
  final String roomName;

  const ReusableRoom({super.key, required this.onlinePeople, required this.roomName});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Color(0xFF263F45),
        borderRadius: BorderRadius.circular(20.0)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
              '$roomName',
            style: GoogleFonts.abel(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 20
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                  Icons.circle,
                color: Colors.greenAccent.shade700,
                size: 20,
              ),
              SizedBox(
                width: 5.0,
              ),
              Text(
                'Online: $onlinePeople',
                style: GoogleFonts.abel(
                  color: Colors.white,
                  fontSize: 20
                ),

              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                      return VideoConferencePage(
                          conferenceID: conferenceDTextCtrl.text);
                    }));
              },
              icon: Icon(
                Icons.video_call_rounded,
                size: 40,
                color: Colors.white,
              )
          )
        ],
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
        userName: 'User1',
        conferenceID: conferenceID,
        config: ZegoUIKitPrebuiltVideoConferenceConfig(),
      ),
    );
  }
}
