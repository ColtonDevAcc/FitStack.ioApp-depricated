import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthServices extends ChangeNotifier {
  bool userLoggedIn = false;

  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  AuthServices(this._firebaseAuth);

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<String> signIn({email: String, password: String}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      userLoggedIn = true;
      return "Signed In";
    } on FirebaseAuthException catch (e) {
      userLoggedIn = false;
      return 'Not Signed In';
    }
  }

  Future<String> signUp({email: String, password: String}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "Signed Up";
    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    }
  }
}
