import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'dashboard.dart';

class PinboardPage extends StatelessWidget {
  const PinboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.teal.shade400,
          body: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => DashBoard()));
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        )
                    ),
                    TextButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              content: TextField(
                                decoration: InputDecoration(
                                    labelText: "Share your thoughts"
                                ),
                              ),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                        'SUBMIT'
                                    )
                                )
                              ],
                            )
                        );
                      },
                      child: Text(
                        'PINBOARD',
                        style: GoogleFonts.luckiestGuy(
                            fontSize: 35.0, color: Colors.white),
                      ),
                    ),
                    SizedBox(width: 40,)
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Expanded(
                  child: Expanded(
                    child: Container(
                      margin: EdgeInsets.all(5.0),
                      color: Colors.yellow.shade500,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 30.0,
                              width: 30.0,
                              child: Image(
                                image: AssetImage(
                                  'images/pinhead.png',
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Covid stole my dearest grandma away, leaving me unable to even say a final goodbye to the woman who meant the world to me.',
                              style: GoogleFonts.abel(
                                fontSize: 20.0
                              ),
                              maxLines: 20,
                              textAlign: TextAlign
                                  .center, // Set the maximum number of lines to ensure it doesn't overflow
                              overflow: TextOverflow
                                  .ellipsis, // Handle text overflow gracefully
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Expanded(
                    child: Container(
                      margin: EdgeInsets.all(5.0),
                      color: Colors.yellow.shade500,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 30.0,
                              width: 30.0,
                              child: Image(
                                image: AssetImage(
                                  'images/pinhead.png',
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Due to the pandemic, my theatre got shut down, and I had no customers due to which I got financially unstable 😔',
                              style: GoogleFonts.abel(
                                  fontSize: 20.0
                              ),
                              maxLines: 20,
                              textAlign: TextAlign
                                  .center, // Set the maximum number of lines to ensure it doesn't overflow
                              overflow: TextOverflow
                                  .ellipsis, // Handle text overflow gracefully
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Expanded(
                    child: Container(
                      margin: EdgeInsets.all(5.0),
                      color: Colors.yellow.shade500,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 30.0,
                              width: 30.0,
                              child: Image(
                                image: AssetImage(
                                  'images/pinhead.png',
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'I got very hopeful when i got to know about this diverse app, It changed my life by providing me hope',
                              style: GoogleFonts.abel(
                                  fontSize: 20.0
                              ),
                              maxLines: 20,
                              textAlign: TextAlign
                                  .center, // Set the maximum number of lines to ensure it doesn't overflow
                              overflow: TextOverflow
                                  .ellipsis, // Handle text overflow gracefully
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
