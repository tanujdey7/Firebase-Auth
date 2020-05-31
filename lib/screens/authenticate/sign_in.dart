import 'package:first_app/screens/auth.dart';
import 'package:first_app/screens/models/user.dart';
import 'package:first_app/shared/constants.dart';
import 'package:first_app/shared/loading.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  SignIn({this.toggleView});
  final Function toggleView;

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  //textfield state
  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign in to Firebase'),
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () {
              widget.toggleView();
            },
            icon: Icon(Icons.person),
            label: Text(
              'Register',
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 50,
        ),
        //Anonyms
        // child: RaisedButton(
        //   onPressed: () async {
        //     dynamic result = await _auth.signInAnon();
        //     if(result == null) {
        //       print('error');
        //     } else {
        //       print('signed in');
        //       print(result.uid);
        //     }
        //   },
        //   child: Text(
        //     'Sign in Anon',
        //   ),
        // ),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              TextFormField(
                decoration: textinputDecoration.copyWith(hintText: 'Email'),
                validator: (value) => value.isEmpty ? 'Enter an email' : null,
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: textinputDecoration.copyWith(hintText: 'Password'),
                validator: (value) =>
                    value.length < 6 ? 'Enter a password 6+ chars long' : null,
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
                obscureText: true,
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    setState(() {
                      loading = true;
                    });
                    dynamic result = await _auth.signInWithEmailandPassword(email, password);
                    if (result == null) {
                      setState(() {
                        loading = false;
                        error = 'Could not sign in with credentials';
                      });
                    }
                  }
                },
                color: Colors.pink[400],
                child: Text(
                  'Sign In',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                error,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
