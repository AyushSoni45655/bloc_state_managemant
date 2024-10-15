import 'package:api_bloc/utility/utild.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthRepositry {
  final FirebaseAuth _firebaseAuth;
  AuthRepositry({FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;
  Stream<User?> get user => _firebaseAuth.authStateChanges();
  Future<void> signUp({required String email, required String password}) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password).then((value) {
          Utils().toastMessage("SignUp Successfully Completed");
    });
  }

  Future<void> login({required String email, required String password}) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password).then((value) {
       Utils().toastMessage("Login Completed!!");
       //Navigator.pushNamed(context, "homepage");
    });
  }

  Future<void> logout() async {
    _firebaseAuth.signOut().then((value) {
      Utils().toastMessage("LogOut Competed Successfully!!!");
    });
  }
}
