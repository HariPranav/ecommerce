import 'package:ecommerce/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService
{
  

  //create and instance of firebase object

  //the _auth object is an instance of the firebase auth class

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user obj based on firebase user 
    User _userFromFirebaseUser(FirebaseUser user)
    {
      return user!=null ? User(uid: user.uid) : null;
    }
  // sign in anno

  // auth change user stream
  // keyword straem then we get a firebase user from the stream and the last part is the stream name
  Stream<User> get user
  {
    // return with the _auth which is the auth object and this stream returns the object returnd onAuthStateChanged
    return _auth.onAuthStateChanged
      .map(_userFromFirebaseUser);
  }

  // when this method is called it checks for the sign in method and then returns a user if present to the calling function
  Future signInAnno() async
  {
    try
    {
      // get an auth req using the auth objecct using the await

        AuthResult result = await _auth.signInAnonymously();
        // now the result object has access to  the current user which has to be stored again in the Class FireBaseUser object called user
         FirebaseUser user = result.user;
         return _userFromFirebaseUser(user);
    }
    catch(e)
    {
      print(e.toString());
      return null;
    }
  }

  //sign in with email and password

     Future signInWithEmailAndPassword(String email,String password) async 
  {
    try
    {
      AuthResult result=await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user=result.user;
      return _userFromFirebaseUser(user);
    }
    catch(e)
    {
      print(e.toString());
      return null;
    }

  }

  // register with email and password

  Future registerWithEmailAndPassword(String email,String password) async 
  {
    try
    {
      AuthResult result=await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user=result.user;
      return _userFromFirebaseUser(user);
    }
    catch(e)
    {
      print(e.toString());
      return null;
    }

  }

  //sign out

  Future SignOut() async
  {
    try
    {
      return await _auth.signOut();
    } 
    catch(e)
    {
      print(e.toString());
      return null;
    }
  }


}