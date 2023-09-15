import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign/auth/page/signout.dart';
import 'package:google_sign/auth/page/new_dashboard.dart';
import 'package:google_sign/auth/page/recent_courses.dart';
import 'package:google_sign/auth/page/sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // home: HomeScreen(
        //   token: '',
        // )
        // );
        home: FirebaseAuth.instance.currentUser?.uid == null
            ? LoginScreen()
            // : HomeScreen(token: ''));
            : TabNavigationScreen());
  }
}





///////////////////////////////////////////////////////////////////////////////////



