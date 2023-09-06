import 'package:flutter/material.dart';
import 'dashboard.dart';

void main() {
  runApp(ChatAI());
}

class ChatAI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _textController = TextEditingController();
  String _displayText = '';
  bool _showInput = true;

  void _handleSubmit() {
    // You can add your logic here to process user input
    String userInput = _textController.text;

    // For this example, we'll simply set a fixed response
    setState(() {
      _displayText = "In the depths of adversity, remember that storms eventually give way to sunshine. ";
      _showInput = false; // Hide the input box after displaying the output
    });
  }

  void _resetInput() {
    setState(() {
      _showInput = true;
      _textController.clear(); // Clear the input text
      _displayText = ''; // Clear the displayed output
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade400,
      appBar: AppBar(
        title: Text('Chat AI'),
        backgroundColor: Colors.teal.shade900,
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'How may I assist you?',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            if (_showInput)
              Container(
                width: 300.0,
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                    width: 2.0,
                  ),
                ),
                child: TextField(
                  controller: _textController,
                  decoration: InputDecoration(
                    hintText: 'Type your message here...',
                    border: InputBorder.none,
                    focusColor: Colors.white
                  ),
                ),
              ),
            SizedBox(height: 20.0),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.teal.shade900)
              ),
              onPressed: () {
                if (_showInput) {
                  _handleSubmit();
                } else {
                  _resetInput(); // Reset input and display text box
                }
              },
              child: Text(_showInput ? 'Submit' : 'Reset'),
            ),
            SizedBox(height: 20.0),
            if (!_showInput)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      _displayText,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}