import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Auth {
  static logIn({
    required BuildContext context,
    required FirebaseAuth firebaseAuthInstance,
    // required UserCredential userCred,
    required String email,
    required String password,
  }) async {
    try {
      var userCred = await firebaseAuthInstance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on PlatformException catch (err) {
      String? errorMessage =
          "An error occured, please check your credentials !";

      if (err.message != null) {
        errorMessage = err.message;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage!),
        ),
      );
    }
  }
}
