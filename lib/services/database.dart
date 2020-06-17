import 'package:brew_crew/models/brewModel.dart';
import 'package:brew_crew/models/user.dart';
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


  //get brewa streamre

  Stream<List<BrewModel>> get brewStream {
      return brewCollection.snapshots().map(_brewlistFromSnapshot);
  }

  //convert snapshots into brewList model
  List<BrewModel> _brewlistFromSnapshot(QuerySnapshot snapshot){

    return snapshot.documents.map((doc){
      return BrewModel(
        name : doc.data['name'] ?? '',
        sugars : doc.data['sugar'] ??  '',
        strength : doc.data['strength'] ?? ''
      );
    }).toList();
    
  }

  //userdata streams 
  Stream<UserData> get userData{
        return brewCollection.document(uid).snapshots()
        .map(_userdatafromsnapshot);
  }

//conovert userdata snapshot to Userdata model

UserData _userdatafromsnapshot(DocumentSnapshot snapshot){

  return UserData(
      uid: uid,
      name: snapshot.data['name'],
      sugar: snapshot.data['sugar'],
      strength: snapshot.data['strength']
  );
}
}