import 'package:flutter/material.dart';
import 'package:google_sign/api/api_fetch.dart';
import 'package:google_sign/model/courses_model.dart';

class CourseListScreen extends StatefulWidget {
  @override
  _CourseListScreenState createState() => _CourseListScreenState();
}

class _CourseListScreenState extends State<CourseListScreen> {
  List<Courses> courses = []; // Initialize with an empty list of courses

  @override
  void initState() {
    super.initState();
    // Call your API function here to fetch courses
    getMoodleCourses().then((fetchedCourses) {
      setState(() {
        courses = fetchedCourses;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Moodle Courses'),
      ),
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(courses[index].fullnamedisplay),
            subtitle: Text(courses[index].coursecategory),
          );
        },
      ),
    );
  }
}

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Moodle Courses',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: CourseListScreen(),
//     );
//   }
// }
