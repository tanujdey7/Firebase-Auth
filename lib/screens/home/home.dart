import 'package:first_app/screens/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text('Sign Out'),
        backgroundColor: Colors.brown[300],
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () async {
              await _auth.signOutAnon();
            },
            icon: Icon(
              Icons.person,
            ),
            label: Text(
              'Log Out',
            ),
          ),
        ],
      ),
      body: Center(
        child: Text('Logged in successfully,'),
      ),
    );
  }
}
