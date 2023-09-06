import 'package:flutter/material.dart';
import 'package:pandamate/dashboard.dart';

void main() {
  runApp(LoginPage());
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.teal.shade400,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.teal.shade900,
        ),
      ),
      home: AuthScreen(),
    );
  }
}

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _isLogin = true;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>(); // Add a form key

  void _switchAuthMode() {
    setState(() {
      _isLogin = !_isLogin;
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _phoneNumberController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isLogin ? 'Login' : 'Sign Up'),
      ),
      body: Center(
        child: Card(
          margin: EdgeInsets.all(20),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey, // Assign the form key
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    if (!_isLogin)
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                            labelText: 'Name',
                            labelStyle: TextStyle(
                                color: Colors.black
                            ),
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.black,
                            )),
                      ),
                    if (!_isLogin)
                      TextFormField(
                        controller: _ageController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: 'Age',
                            labelStyle: TextStyle(
                                color: Colors.black
                            ),
                            prefixIcon: Icon(
                              Icons.attribution_rounded,
                              color: Colors.black,
                            )),
                      ),
                    if (!_isLogin)
                      TextFormField(
                        controller: _phoneNumberController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            labelText: 'Phone Number',
                            labelStyle: TextStyle(
                                color: Colors.black
                            ),
                            prefixIcon: Icon(
                              Icons.phone,
                              color: Colors.black,
                            )),
                      ),
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(
                              color: Colors.black
                          ),
                          prefixIcon: Icon(
                            Icons.mail,
                            color: Colors.black,
                          )),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            color: Colors.black
                          ),
                          prefixIcon: Icon(
                            Icons.key,
                            color: Colors.black,
                          )),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Validate the form
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DashBoard()));
                        }
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.teal.shade900)),
                      child: Text(
                        _isLogin ? 'Login' : 'Sign Up',
                      ),
                    ),
                    TextButton(
                      onPressed: _switchAuthMode,
                      child: Text(
                        _isLogin
                            ? 'Create an account'
                            : 'I already have an account',
                        style: TextStyle(color: Colors.teal.shade900),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
