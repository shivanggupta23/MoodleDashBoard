// import 'package:http/http.dart' as http;
// import 'dart:convert';

// void getStarredCourses(String token) async {
//   final String url = "https://school.moodledemo.net/webservice/rest/server.php";

//   final Map<String, String> parameters = {
//     "wstoken": token,
//     "wsfunction": "block_starredcourses_get_starred_courses",
//     "moodlewsrestformat": "json",
//   };

//   final response = await http.post(Uri.parse(url), body: parameters);

//   if (response.statusCode == 200) {
//     final data = json.decode(response.body);
//     print("block_starredcourses_get_starred_courses === $data");
//     // Handle the parsed JSON response here and process the list of starred courses
//   } else {
//     print("Error: ${response.statusCode}");
//   }
// }

