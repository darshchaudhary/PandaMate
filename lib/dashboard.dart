//ignore_for_file:prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pandamate/aboutus.dart';
import 'package:pandamate/chatai.dart';
import 'package:pandamate/collaborators.dart';
import 'package:pandamate/couponpage.dart';
import 'package:pandamate/game.dart';
import 'package:pandamate/hibernation.dart';
import 'package:pandamate/loginpage.dart';
import 'package:pandamate/testimonials.dart';
import 'package:pandamate/tropicalrooms.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'pandacamps.dart';

void main() {
  runApp(DashBoard());
}

int bambooPoints = 0;

class DashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          // scaffoldBackgroundColor:
          ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final myController = TextEditingController();
  String? userFeedback = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        hoverElevation: 5,
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => CouponPage()));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
              width: 30,
              child: Image(
                  image: AssetImage('images/bamboo_points.png')
              ),
            ),
            Text(
              '$bambooPoints',
              style: TextStyle(
                fontSize: 12,
                color: Colors.black
              ),
            )
          ],
        ),
      ),
      backgroundColor: Colors.teal.shade400,
      body: CustomScrollView(
        // physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            stretchTriggerOffset: 300.0,
            expandedHeight: 200.0,
            backgroundColor: Colors.teal.shade800,
            leading: Container(
              margin: EdgeInsets.all(5.0),
              child: IconButton(
                icon: Icon(
                  Icons.person,
                  size: 35,
                  weight: 20,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                },
              ),
            ),
            titleTextStyle: TextStyle(fontSize: 30.0),

            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            automaticallyImplyLeading: false,
            actions: [
              Builder(
                builder: (context) => Container(
                    height: 75,
                    width: 50,
                    margin: EdgeInsets.all(5.0),
                    child: TextButton(
                      onPressed: () {
                        Scaffold.of(context).openEndDrawer();
                      },
                      child: Image.asset('images/pandamate_logo.png',
                          fit: BoxFit.contain),
                    )),
              )
            ],
            flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  'PandaMate',
                  style: GoogleFonts.calistoga(
                      fontSize: 35.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                background:
                Image.asset('images/jungle_back.png', fit: BoxFit.cover)),

            floating:
            false, // Set this to true if you want the app bar to float
            pinned:
            true, // Set this to false if you want the app bar to hide when scrolling
            // Add other SliverAppBar properties as needed
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xFF263F45),
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(
                            color: Colors.white,
                            width: 2
                        )
                    ),
                    margin: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 10.0),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Text(
                            'Hello! How are you feeling today?',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.calistoga(
                              fontSize: 25.0,
                              color: Colors.white
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Emojis(imgNo: 1, identifyEmo: 1,),
                              Emojis(imgNo: 2, identifyEmo: 2,),
                              Emojis(imgNo: 3, identifyEmo: 3,),
                              Emojis(imgNo: 4, identifyEmo: 4,),
                              Emojis(imgNo: 5, identifyEmo: 5,),
                            ],
                          )
                        ],
                      ),
                    )
                  ),
                  ReusableButton(
                    childImg: Image.asset('images/tropical_button.png'),
                    targetPage: TropicalRooms(),
                  ),
                  ReusableButton(
                    childImg: Image.asset('images/camps_button.png'),
                    targetPage: JoinMeeting(),
                  ),
                  ReusableButton(
                    childImg: Image.asset('images/chat_button.png'),
                    targetPage: ChatAI(),
                  ),
                  ReusableButton(
                    childImg: Image.asset('images/tictactoe.png'),
                    targetPage: TicTacToeGame(),
                  ),
                  ReusableButton(
                    childImg: Image.asset('images/hiber_button.png'),
                    targetPage: Hibernation(),
                  ),
                  SizedBox(height: 20.0),
                ],
              ),
            ),
          ),
        ],
      ),
      endDrawer: MyDrawer(),
    );
  }
}

class Emojis extends StatelessWidget {


  final int imgNo;
  final int identifyEmo;

  const Emojis({super.key, required this.imgNo, required this.identifyEmo});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(
                  identifyEmo == 1? 'Oh no! Seems like you are having a bam-booo day':
                  identifyEmo == 2? 'We know just the thing you need - PANDAS!':
                  identifyEmo==3?'Well, seems like your day is going just fine':
                  identifyEmo==4?'Happy to hear that your day is going well!': 'Wow! looks like you saw some Pandas today!'
                ),
              )
          );
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Image(
              image: AssetImage('images/$imgNo.png'),
            ),
          ),
        ),
      ),
    );
  }
}


class ReusableButton extends StatelessWidget {
  const ReusableButton(
      {super.key, required this.childImg, required this.targetPage});

  final Image childImg;
  final Widget targetPage;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 7.5),
      child: Padding(
        padding: EdgeInsets.zero,
        child: FittedBox(
          fit: BoxFit.fill,
          child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.transparent),
            ),
            onPressed: () {
                bambooPoints+=1;
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => targetPage));
            },
            child: childImg,
          ),
        ),
      ),
    );
  }
}



class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.teal.shade600,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ListView(
          children: [
            ListTile(
              title: Text(
                'ABOUT APP',
                style: GoogleFonts.abel(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w900
                ),
              ),
              onTap: () {

                Navigator.push(context, MaterialPageRoute(builder: (context) => AboutUsPage()));
              },
            ),
            ListTile(
              title: Text(
                'YOUR THOUGHTS',
                style: GoogleFonts.abel(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w900
                ),
              ),
              onTap: () {

                Navigator.push(context, MaterialPageRoute(builder: (context) => PinboardPage()));
              },
            ),

            ListTile(
              title: Text(
                  'COLLABORATORS',
                style: GoogleFonts.abel(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w900
                ),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AvatarPage()));

              },
            ),
          ],
        ),
      )
    );
  }
}
