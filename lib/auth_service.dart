import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;


  Future<User?> createUserWithEmailAndPassword(String email, String password) async {
    try {
      final cred = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return cred.user;
    } on FirebaseException catch(e){
      exceptionHandler(e.code);
    }

    catch (e) {
      log("Something went wrong: $e");
      return null;
    }
    return null;
  }

  Future<User?> loginUserWithEmailAndPassword(String email, String password) async {
    try {
      final cred = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return cred.user;
    }on FirebaseException catch(e){
      exceptionHandler(e.code);
    }
    catch (e) {
      log("Something went wrong: $e");
      return null;
    }
    return null;
  }

  Future<void> signout() async {
    try {
      await _auth.signOut();
    } catch (e) {
      log("Something went wrong: $e");
    }
  }
}

exceptionHandler(String code){
  switch(code){
    case"invalid-credential":
      log("your login credentials are invalid");
      case"Week password ":
        log("Your password must contain 8 letter");
    case"email is already in use":
      log("user ifd already exit");
    default:log("something went wrong");
  }
}

