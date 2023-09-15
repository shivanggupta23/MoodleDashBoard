// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:google_sign/auth/page/dashboard.dart';
// import 'package:http/http.dart' as http;

// // void main() {
// //  runApp(MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //  @override
// //  Widget build(BuildContext context) {
// //   return MaterialApp(
// //    title: 'Moodle LMS Login',
// //    theme: ThemeData(primarySwatch: Colors.blue),
// //     home: LoginPage(),
// //     );
// //   }
// // }

// // class LoginPage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text('Moodle LMS Login')),
// //       body: LoginForm(),
// //     );
// //   }
// // }

// class LoginForm extends StatefulWidget {
//   @override
//   _LoginFormState createState() => _LoginFormState();
// }

// class _LoginFormState extends State<LoginForm> {
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   Future<void> _login() async {
//     final String username = _usernameController.text;
//     final String password = _passwordController.text;

//     final url = Uri.parse("https://mylearning.magicedtech.com/login/token.php"
//         "?service=moodle_mobile_app"
//         "&username=$username"
//         "&password=$password");

//     final response = await http.post(url);

//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       final token = data['token'] as String;

//       // Store the token securely (e.g., using flutter_secure_storage)
//       // Navigate to the next screen
//       // ignore: use_build_context_synchronously
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) => HomeScreen(token: token),
//         ),
//       );
//     } else {
//       // ignore: use_build_context_synchronously
//       showDialog(
//         context: context,
//         builder: (context) => AlertDialog(
//           title: const Text('Login Failed'),
//           content: const Text('Invalid credentials. Please try again.'),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Text('OK'),
//             ),
//           ],
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           TextFormField(
//             controller: _usernameController,
//             decoration: const InputDecoration(labelText: 'Username'),
//           ),
//           TextFormField(
//             controller: _passwordController,
//             decoration: const InputDecoration(labelText: 'Password'),
//             obscureText: true,
//           ),
//           const SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: _login,
//             child: const Text('Login'),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // class HomeScreen extends StatelessWidget {
// //   final String token;

// //   HomeScreen({required this.token});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text('Welcome')),
// //       body: Center(
// //         child: Text('Logged in with token: $token'),
// //       ),
// //     );
// //   }
// // }
