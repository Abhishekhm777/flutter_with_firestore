import 'package:brew_crew/models/brewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'brew_tile.dart';
import 'package:brew_crew/screens/home/brew_tile.dart';

class BrewList extends StatefulWidget {
  @override
  _BrewListState createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    
   final brews =Provider.of<List<BrewModel>>(context) ?? [];
   brews.forEach((element) {
     print(element.name);
     print(element.sugars);
     print(element.strength);
   });
  
    return ListView.builder(
      itemBuilder: (context,index){
         
         return BrewTile(brewModel:brews[index]);
      },
      itemCount: brews.length,
      );
  }
}