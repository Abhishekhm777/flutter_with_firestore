import 'package:brew_crew/models/brewModel.dart';
import 'package:brew_crew/screens/home/settings_form.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:brew_crew/screens/home/brew_list.dart';

class Home extends StatelessWidget {
  final AuthService _authService =AuthService();
  @override
  Widget build(BuildContext context) {

    void _showSetting(){
      showModalBottomSheet(context: context, builder: (context0){
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 60.0),
          child: SettingsForm(),
        );
      }); 
    }

    return StreamProvider<List<BrewModel>>.value(
      value: DatabaseService().brewStream,
          child: Scaffold(
        backgroundColor: Colors.blueGrey[10],
        appBar: AppBar(
          backgroundColor: Colors.brown,
          elevation: 0.0,
          title: Text('Brew Crew'),
          actions: <Widget>[
            FlatButton.icon(
              onPressed: () async{
               await _authService.sugnOut();
              }, 
              icon: Icon(Icons.person), 
              label: Text('Sign-out')),

              FlatButton.icon(
                onPressed: () => _showSetting(), 
                icon: Icon(Icons.settings), 
                label:  Text('Settings')
                ),


          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
            image: AssetImage('assets/coffe.jpg'),
            fit: BoxFit.cover
            ), 
          ),
          child: BrewList()
          ),
        
      ),
    );
  }
}