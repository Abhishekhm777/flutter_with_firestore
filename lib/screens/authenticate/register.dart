import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {

  final Function toggleVeiw;
  Register({this.toggleVeiw});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
   final AuthService _authService= AuthService();
  String email='';
    String password='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        title: Text('Sign-up to BrewCrew'),
        backgroundColor: Colors.blue[800],
         actions: <Widget>[
          FlatButton.icon(onPressed: (){
                
          },
           icon: Icon(Icons.person),
            label: Text('Sign-in'))
        ],
      ),
      body: Container(
        padding:EdgeInsets.symmetric(vertical:20.0,horizontal:50.0),
        child:Form(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                onChanged: (val){
                     setState(() {
                       email=val;
                     });
                },
              ),
                SizedBox(height: 20.0),
                 TextFormField(
                   obscureText: true,
                onChanged: (val){
                        setState(() {
                       password=val;
                     });
                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.grey[500],
                child: Text('Sign-up',
                style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                    print(email);
                     print(password);
                },
              ),
            ],
          ),
          ),
      ),
    );
  }
}