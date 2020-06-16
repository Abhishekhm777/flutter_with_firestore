import 'package:brew_crew/models/user.dart';
import 'package:brew_crew/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  final FirebaseAuth _auth=FirebaseAuth.instance;
  //create user object based on firebase user

  User _userFromFireBaseUser(FirebaseUser user){
    
    return user !=null ? User(uid:user.uid) : null;

  }
  //auth change streammm

  Stream<User> get user{
    return _auth.onAuthStateChanged
    //same as below lin  -- .map((FirebaseUser user) => _userFromFireBaseUser(user));
    .map(_userFromFireBaseUser);
  }

  //sin in anonymous 
  Future signInAnon() async{
    try{
       AuthResult rsults= await _auth.signInAnonymously();
       FirebaseUser user=rsults.user;
        return _userFromFireBaseUser(user);
    }catch(e){
      print(e.toString());
          

    }
  }

  //signing out

  Future sugnOut() async{

    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());

      return null;
    }
  }

  // registering  with email and password

  Future register(String email,String password) async{
    try{
      
      AuthResult authResults= await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user=authResults.user;
       await DatabaseService(uid:user.uid).updateUserData('0', 'new crew member', 100);
      return _userFromFireBaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

// sign-in using email and password

Future signIn(String email,String password) async{
    try{
      
      AuthResult authResults= await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user=authResults.user;

     //create new document for the user with id
    

      return _userFromFireBaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  
}