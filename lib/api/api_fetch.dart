import 'dart:convert';

import 'package:google_sign/auth/page/sign_in.dart';
import 'package:google_sign/model/courses_model.dart';
import 'package:http/http.dart' as http;

Future<List<Courses>> getMoodleCourses() async {
  // final String token;
  // LoginScreen token = new LoginScreen();

  // getMoodleCourses({required this.token});

  const String apiUrl =
      'https://mylearning.magicedtech.com/webservice/rest/server.php';

  final Map<String, String> requestData = {
    'wstoken': '65debc438bb840fa3bc43a71e63d9991',
    'wsfunction': 'core_course_get_recent_courses',
    // 'wsfunction': 'core_course_get_contents',
    'moodlewsrestformat': 'json',
  };

  final http.Response response =
      await http.post(Uri.parse(apiUrl), body: requestData);

  if (response.statusCode == 200) {
    print('response: ${response.body}');
    final List<dynamic> responseData = json.decode(response.body);
    List<Courses> courses =
        responseData.map((data) => Courses.fromJson(data)).toList();
    return courses;
  } else {
    print('Error: ${response.statusCode}');
    return [];
  }
}
