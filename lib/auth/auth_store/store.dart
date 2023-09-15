import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseService {
  final _firebaseAuth = FirebaseAuth.instance;
  String? _uid;
  UserCredential? result;
  User? user;
  String get uid => _uid!;

  void googleSignUp(BuildContext context, Function onSuccess) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential authCredential = GoogleAuthProvider.credential(
            idToken: googleSignInAuthentication.idToken,
            accessToken: googleSignInAuthentication.accessToken);

        // Getting users credential
        result = await _firebaseAuth.signInWithCredential(authCredential);
        user = result!.user;
        if (user != null) {
          print(user?.displayName);
          // firbase.setUserData(user!.uid);
          onSuccess();
        }
      }
      if (googleSignInAccount == null) {
        return;
      }
    } on FirebaseAuthException catch (error) {
      Navigator.of(context).pop();
    }
  }
}
