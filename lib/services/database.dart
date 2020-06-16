import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{

  final String uid;
  DatabaseService({this.uid});

  //collectin refference

  final CollectionReference brewCollection = Firestore.instance.collection('brew');


  Future updateUserData(String sugar,String name,int strength)async{

   return await brewCollection.document(uid).setData(
     {
     'sugar' : sugar,
     'name' : name,
     'strength' : strength,
     }

   );

  }
}