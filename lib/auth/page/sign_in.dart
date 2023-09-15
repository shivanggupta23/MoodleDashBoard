import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_sign/auth/auth_store/store.dart';
import 'package:google_sign/auth/page/new_dashboard.dart';
import 'package:google_sign/auth/page/signout.dart';
import 'package:google_sign/auth/page/recent_courses.dart';
import 'package:http/http.dart' as http; // Import the http package

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseService firebaseService = FirebaseService();
  // final AuthService _authService = AuthService();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _login() async {
    final String username = _usernameController.text;
    final String password = _passwordController.text;

    final url = Uri.parse("https://mylearning.magicedtech.com/login/token.php"
        "?service=moodle_mobile_app"
        "&username=$username"
        "&password=$password");

    final response = await http.post(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final token = data['token'] as String;

      // Store the token securely (e.g., using flutter_secure_storage)
      // Navigate to the next screen
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          // builder: (context) => HomeScreen(token: token),
          builder: (context) => TabNavigationScreen(),
        ),
      );
    } else {
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Login Failed'),
          content: const Text('Invalid credentials. Please try again.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          "https://cdn.dribbble.com/users/31664/screenshots/696868/media/cabcb1b53bf3d018516e461d077fea1d.png?resize=400x300&vertical=center", // Update with your actual image asset path
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          // width: double.infinity,
          // height: double.infinity,
        ),
        Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: Center(
            child: Container(
              width: 370,
              height: MediaQuery.of(context).size.height * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: double.infinity,
                    height: 120,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      color: Colors.blue,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20),
                          Text(
                            "Magic's Learning Portal",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 30),
                          Text(
                            "Cookies must be enabled in your browser",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const Row(
                          children: [
                            Text(
                              "Already have an account?",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Column(
                          children: [
                            TextFormField(
                              controller: _usernameController,
                              // controller: ,
                              decoration: InputDecoration(
                                labelText: "Username",
                                prefixIcon: const Icon(Icons.person),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(0),
                                ),
                              ),
                            ),
                            TextFormField(
                              controller: _passwordController,
                              decoration: InputDecoration(
                                labelText: "Password",
                                prefixIcon: const Icon(Icons.lock),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(0),
                                ),
                              ),
                              obscureText: true,
                            ),
                          ],
                        ),
                        const SizedBox(height: 0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(value: false, onChanged: (value) {}),
                            const Text("Remember Username"),
                          ],
                        ),
                        const SizedBox(height: 6),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _login,
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blue,
                              onPrimary: Colors.white,
                              padding: const EdgeInsets.all(16.0),
                            ),
                            child: const Text(
                              "Log in",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text("Other log in providers:",
                            style: TextStyle(fontSize: 14)),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 230,
                              height: 50,
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  firebaseService.googleSignUp(
                                      context, onSuccess);
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.red,
                                  onPrimary: Colors.white,
                                  padding: const EdgeInsets.all(16.0),
                                ),
                                icon: const Icon(Icons.login,
                                    color: Colors.white),
                                label: const Text(
                                  "Login in with Google",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  // void onSuccess() {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //         builder: (context) => HomeScreen(
  //               token: '',
  //             )),
  //   );
  // }

  void onSuccess() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => TabNavigationScreen()));
  }
}
