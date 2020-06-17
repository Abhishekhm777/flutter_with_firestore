import 'package:flutter/material.dart';
import 'package:brew_crew/models/brewModel.dart';

class BrewTile extends StatelessWidget {
  final BrewModel brewModel ;

  BrewTile({this.brewModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
     padding: EdgeInsets.only(top:8.0),
     child: Card(
       margin:EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
       child: ListTile(
         leading: CircleAvatar(
           radius:25.0,
           backgroundColor: Colors.brown[brewModel.strength] ,
           backgroundImage: AssetImage('assets/coffee_icon.png'),
         
         ),
           title :Text(brewModel.name),
           subtitle: Text('Takes ${brewModel.sugars}  sugar(s)'),
           
         
       ),
     ),
   
    );
  }
}