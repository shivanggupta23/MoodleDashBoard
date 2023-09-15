// import 'package:flutter/material.dart';
// import 'package:google_sign/model/courses_model.dart';

// class RecentWidget extends StatefulWidget {
//   @override
//   State<RecentWidget> createState() => _RecentWidgetState();
// }

// class _RecentWidgetState extends State<RecentWidget> {
//   final PageController _pageController = PageController(initialPage: 0);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // alignment: Center,
//       height: 250,
//       margin: const EdgeInsets.only(bottom: 10),
//       padding: const EdgeInsets.all(10.0),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey),
//         borderRadius: BorderRadius.circular(10.0),
//       ),
// child: Column(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   children: [
//     const Text(
//       'Recently accessed courses',
//       style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
//     ),
//     IconButton(
//       icon: const Icon(Icons.arrow_back_ios),
//       onPressed: () {
//         _pageController.previousPage(
//           duration: const Duration(milliseconds: 300),
//           curve: Curves.easeInOut,
//         );
//       },
//     ),
//     IconButton(
//       icon: const Icon(Icons.arrow_forward_ios),
//       onPressed: () {
//         _pageController.nextPage(
//           duration: const Duration(milliseconds: 300),
//           curve: Curves.easeInOut,
//         );
//       },
//     ),
//   ],
// ),
//           const SizedBox(height: 15.0),
//           Container(
//             height: 150.0,
//             child: PageView.builder(
//               controller: _pageController,
//               scrollDirection: Axis.horizontal,
//               itemCount: 10, // Number of small containers
//               itemBuilder: (context, index) {
//                 return SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Row(
//                     children: [
//                       Container(
//                         width: 275.0,
//                         margin: const EdgeInsets.symmetric(horizontal: 10.0),
//                         decoration: BoxDecoration(
//                           border: Border.all(color: Colors.grey),
//                           borderRadius: BorderRadius.circular(10.0),
//                         ),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Container(
//                               padding: const EdgeInsets.only(
//                                   top: 0, left: 0, right: 0, bottom: 0),
//                               width: double.infinity,
//                               height: 70,
//                               decoration: const BoxDecoration(
//                                 image: DecorationImage(
//                                   image: NetworkImage(
//                                     'https://cdn.dribbble.com/users/31664/screenshots/696868/media/cabcb1b53bf3d018516e461d077fea1d.png?resize=400x300&vertical=center',
//                                   ),
//                                   fit: BoxFit
//                                       .cover, // This will ensure the image fills the container
//                                 ),
//                               ),
//                               // Adjust this value as needed
//                               //   child: Image.network(
//                               //   'https://images.unsplash.com/photo-1493612276216-ee3925520721?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=464&q=80'),
//                               //  fit: BoxFit.cover,
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.all(10.0),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   const Text(
//                                     'Conflict Management Styles',
//                                     style: TextStyle(
//                                         // fontWeight: FontWeight.bold,
//                                         fontSize: 18),
//                                   ),
//                                   // ListView.builder(
//                                   //   itemCount: courses.length,
//                                   //   itemBuilder: (context, index) {
//                                   //     return ListTile(
//                                   //       title: Text(
//                                   //           courses[index].fullnamedisplay),
//                                   //       subtitle:
//                                   //           Text(courses[index].coursecategory),
//                                   //     );
//                                   //   },
//                                   // ),
//                                   const SizedBox(
//                                     height: 10,
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.only(right: 15.0),
//                                     child: Container(
//                                       width: double.infinity,
//                                       decoration: BoxDecoration(
//                                         color: const Color.fromRGBO(
//                                             241, 221, 202, 1.0),
//                                         borderRadius: BorderRadius.circular(
//                                             10.0), // Adjust the radius as needed
//                                       ),
//                                       child: const Text(
//                                         'Soft Skills Enhancement Series',
//                                         style: TextStyle(
//                                           fontSize: 15,
//                                           color:
//                                               Color.fromRGBO(144, 105, 73, 1.0),
//                                         ),
//                                       ),
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_sign/api/api_fetch.dart';
import 'package:google_sign/model/courses_model.dart';

class RecentWidget extends StatefulWidget {
  @override
  State<RecentWidget> createState() => _RecentWidgetState();
}

class _RecentWidgetState extends State<RecentWidget> {
  final PageController _pageController = PageController(initialPage: 0);
  late Future<List<Courses>> _coursesFuture;

  @override
  void initState() {
    super.initState();
    _loadCourses();
  }

  Future<void> _loadCourses() async {
    _coursesFuture = getMoodleCourses();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Recently accessed courses',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  _pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.arrow_forward_ios),
                onPressed: () {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
              ),
            ],
          ),
          // Rest of your code...
          FutureBuilder<List<Courses>>(
            future: _coursesFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Text('No courses available.');
              } else {
                return Container(
                  height: 201.0,
                  child: PageView.builder(
                    controller: _pageController,
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final course = snapshot.data![index];

                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Container(
                              width: 275.0,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(
                                        top: 0, left: 0, right: 0, bottom: 0),
                                    width: double.infinity,
                                    height: 70,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(course.courseimage),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          course.fullnamedisplay,
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        const SizedBox(height: 10),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 15.0),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color: const Color.fromRGBO(
                                                  241, 221, 202, 1.0),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            child: Text(
                                              course.coursecategory,
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Color.fromRGBO(
                                                    144, 105, 73, 1.0),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
