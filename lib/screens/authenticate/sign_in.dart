import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/shared/constants.dart';
import 'package:brew_crew/shared/loading.dart';
import 'package:flutter/material.dart';


class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _authService= AuthService();
   final _formKey =GlobalKey<FormState>();

    String email='';
      String password='';
        String error='';
        bool loading =false;

  @override
  Widget build(BuildContext context) {
    return loading?Loading():Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: <Widget>[
          FlatButton.icon(onPressed: (){
                widget.toggleView();
          },
           icon: Icon(Icons.person),
            label: Text('Register'))
        ],
        title: Text('Sign In to BrewCrew'), 
        backgroundColor: Colors.brown[600],
      ),
      body: Container(
        padding:EdgeInsets.symmetric(vertical:20.0,horizontal:50.0),
        child:Form(
            key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                  decoration: textInputDecorartion.copyWith(hintText:'Email'),
             validator: (val) => val.isEmpty ? 'Enter an Email':null,

                onChanged: (val){
                     setState(() {
                       email=val;
                     });
                },
              ),
                SizedBox(height: 20.0),
                 TextFormField(
                     decoration: textInputDecorartion.copyWith(hintText:'Password'),
                validator: (val) => val.length < 6 ? 'Enter a  password 6+ char long ':null,

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
                child: Text('Sign-in',
                style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                   if(_formKey.currentState.validate()){
                     setState(() => loading=true);
              
                    dynamic result = await _authService.signIn(email, password);
                    if(result==null ){
                       setState(() {
                         error='COULD NOT SIGN-IN WITH THOSE CREDENTIALS';
                         loading=false;
                       });
                
                    }else{

                    }
                   }
                }
              ),
               SizedBox(height: 15.5,),
              Text(error,
              style: TextStyle(color: Colors.redAccent,
              fontSize: 15.0),)
            ],
          ),
          ),
      ),
    );
  }
}