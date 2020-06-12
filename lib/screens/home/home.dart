import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final AuthService _authService =AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[10],
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        elevation: 0.0,
        title: Text('Brew Crew'),
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () async{
             await _authService.sugnOut();
            }, 
            icon: Icon(Icons.person), 
            label: Text('Sign-out'))
        ],
      ),
    );
  }
}