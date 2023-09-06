import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pandamate/dashboard.dart';

void main() {
  runApp(Hibernation());
}

class Hibernation extends StatelessWidget {
  const Hibernation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isPlaying = false;
  double value = 0;
  final player = AudioPlayer();
  Duration? duration;

  void initPlayer() async {
    await player.setSource(AssetSource("meditate.mp3"));
    duration = await player.getDuration();
  }

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  Future<void> play() async {
    if (isPlaying) {
      await player.pause();
    } else {
      await player.resume();
      player.onPositionChanged.listen(
            (Duration d) {
          setState(() {
            value = d.inSeconds.toDouble();
            print(value);
          });
        },
      );
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          if (isPlaying) {
            await player.stop(); // Stop the music when the HOME button is pressed
          }
          return true;
        },
        child: Stack(
          children: [
            Container(
              constraints: BoxConstraints.expand(),
              height: 300.0,
              width: 300.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/medi_panda.jpeg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 28, sigmaY: 28),
                child: Container(
                  color: Colors.black.withOpacity(0.6),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Image.asset(
                    "images/medi_panda.jpeg",
                    width: 250.0,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Meditate",
                  style: GoogleFonts.calistoga(
                      color: Colors.white, fontSize: 40.0),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      duration != null
                          ? "${(value / 60).floor()}: ${(value % 60).floor()}"
                          : "Loading...",
                      style: TextStyle(color: Colors.white),
                    ),
                    Container(
                      width: 260.0,
                      child: Slider.adaptive(
                        onChangeEnd: (new_value) async {
                          setState(() {
                            value = new_value;
                          });
                          await player.seek(Duration(seconds: new_value.toInt()));
                        },
                        min: 0.0,
                        value: value,
                        max: 400.0,
                        onChanged: (new_value) {
                          setState(() {
                            value = new_value;
                          });
                        },
                        activeColor: Colors.white,
                      ),
                    ),
                    Text(
                      duration != null
                          ? "${duration!.inMinutes} : ${duration!.inSeconds % 60}"
                          : "Loading...",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: 60.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60.0),
                        color: Colors.black87,
                        border: Border.all(color: Colors.white38),
                      ),
                      width: 50.0,
                      height: 50.0,
                      child: InkWell(
                        onTapDown: (details) {
                          player.setPlaybackRate(0.5);
                        },
                        onTapUp: (details) {
                          player.setPlaybackRate(1);
                        },
                        child: Center(
                          child: Icon(
                            Icons.fast_rewind_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60.0),
                        color: Colors.black87,
                        border: Border.all(color: Colors.pink),
                      ),
                      width: 60.0,
                      height: 60.0,
                      child: InkWell(
                        onTap: () {
                          play(); // Call the play function
                        },
                        child: Center(
                          child: Icon(
                            isPlaying
                                ? Icons.pause
                                : Icons.play_arrow,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60.0),
                        color: Colors.black87,
                        border: Border.all(color: Colors.white38),
                      ),
                      width: 50.0,
                      height: 50.0,
                      child: InkWell(
                        onTapDown: (details) {
                          player.setPlaybackRate(2);
                        },
                        onTapUp: (details) {
                          player.setPlaybackRate(1);
                        },
                        child: Center(
                          child: Icon(
                            Icons.fast_forward_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 60.0,
                ),
                SizedBox(
                  height: 50,
                  width: 120,
                  child: TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.black87),
                        shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            )
                        )
                    ),
                    onPressed: () {
                      isPlaying = false;
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DashBoard()));
                    },
                    child: Text(
                      'HOME',
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
