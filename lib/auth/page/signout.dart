import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign/auth/auth_store/auth_service.dart';
import 'package:google_sign/auth/page/sign_in.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String token;

  HomeScreen({super.key, required this.token});
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          _authService.signOut();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        },
        child: Text('Sign Out'),
      ),
    );
  }
}
