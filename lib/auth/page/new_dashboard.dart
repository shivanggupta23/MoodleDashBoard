import 'package:flutter/material.dart';
import 'package:google_sign/api/api_fetch.dart';
import 'package:google_sign/auth/page/signout.dart';
import 'package:google_sign/components/Recent_widget.dart';
import 'package:google_sign/components/dropdown.dart';
import 'package:google_sign/model/courses_model.dart';

class TabNavigationScreen extends StatefulWidget {
  @override
  _TabNavigationScreenState createState() => _TabNavigationScreenState();
}

class _TabNavigationScreenState extends State<TabNavigationScreen> {
  int _selectedIndex = 0;
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

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Magic's Learning Portal",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Add your search functionality here
            },
          ),
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              // Add your profile functionality here
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildTabItem("Dashboard", 0),
                _buildTabItem("SiteHome", 1),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              height: 1.0,
              width: double.infinity,
              color: Colors.grey,
            ),
            _selectedIndex == 0 ? DashboardTab() : SiteHomeTab(),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem(String title, int index) {
    return GestureDetector(
      onTap: () => _onTabTapped(index),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 10.0),
          Text(
            title,
            style: TextStyle(
              fontSize: 18.0,
              color: _selectedIndex == index ? Colors.orange : Colors.black,
            ),
          ),
          Container(
            height: 2.0,
            width: 30.0,
            color: _selectedIndex == index ? Colors.orange : Colors.transparent,
          ),
        ],
      ),
    );
  }
}

class DashboardTab extends StatefulWidget {
  @override
  State<DashboardTab> createState() => _DashboardTabState();
}

class _DashboardTabState extends State<DashboardTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          // Your content here...
          RecentWidget(),
          RoundedBoxWithContent(),
          SizedBox(
            height: 10,
          ),
          HomeScreen(token: '')
        ],
      ),
    );
  }
}

// class DashboardTab extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(20.0),
//       child: Column(
//         children: [
//           RoundedBoxWithContent(),
//         ],
//       ),
//     );
//   }
// }

class SiteHomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          // Your content here...
          RecentWidget(),
          RoundedBoxWithContent(),
          SizedBox(
            height: 10,
          ),
          HomeScreen(token: '')
        ],
      ),
    );
  }
}

class RoundedBoxWithContent extends StatefulWidget {
  @override
  _RoundedBoxWithContentState createState() => _RoundedBoxWithContentState();
}

class _RoundedBoxWithContentState extends State<RoundedBoxWithContent> {
  List<Courses> courses = [];

  @override
  void initState() {
    super.initState();
    fetchCourses();
  }

  Future<void> fetchCourses() async {
    List<Courses> fetchedCourses = await getMoodleCourses();
    setState(() {
      courses = fetchedCourses;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Course overview",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.cloud_download_rounded,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    // Add download functionality here
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 5.0),
          // ... (rest of your code)

          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: const Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Icon(Icons.search),
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Filter my courses",
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          Row(
            children: [
              DropdownExample(),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.download),
                onPressed: () {
                  // Add download functionality here
                },
              ),
              IconButton(
                icon: const Icon(Icons.grid_view),
                onPressed: () {
                  // Add grid view functionality here
                },
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            children: courses.map((course) {
              return _buildSmallerContainer(course);
            }).toList(),
          ),
        ],
      ),
    );
  }

// class RoundedBoxWithContent extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(10.0),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10.0),
//         border: Border.all(
//           color: Colors.grey,
//           width: 1,
//         ),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             padding: const EdgeInsets.all(10.0),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(10.0),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Text(
//                   "Course overview",
//                   style: TextStyle(
//                       color: Colors.black,
//                       // fontWeight: FontWeight.bold,
//                       fontSize: 20),
//                 ),
//                 IconButton(
//                   icon: const Icon(
//                     Icons.cloud_download_rounded,
//                     color: Colors.black,
//                   ),
//                   onPressed: () {
//                     // Add download functionality here
//                   },
//                 ),
//               ],
//             ),
//           ),
  // const SizedBox(height: 10.0),
  // Container(
  //   decoration: BoxDecoration(
  //     border: Border.all(
  //       color: Colors.grey,
  //       width: 1,
  //     ),
  //     borderRadius: BorderRadius.circular(10.0),
  //   ),
  //   child: const Row(
  //     children: [
  //       Padding(
  //         padding: EdgeInsets.symmetric(horizontal: 10.0),
  //         child: Icon(Icons.search),
  //       ),
  //       Expanded(
  //         child: TextField(
  //           decoration: InputDecoration(
  //             border: InputBorder.none,
  //             hintText: "Filter my courses",
  //           ),
  //         ),
  //       ),
  //     ],
  //   ),
  // ),
  // const SizedBox(height: 10.0),
  // Row(
  //   children: [
  //     DropdownExample(),
  //     const Spacer(),
  //     IconButton(
  //       icon: const Icon(Icons.download),
  //       onPressed: () {
  //         // Add download functionality here
  //       },
  //     ),
  //     IconButton(
  //       icon: const Icon(Icons.grid_view),
  //       onPressed: () {
  //         // Add grid view functionality here
  //       },
  //     ),
  //   ],
  // ),
  // const SizedBox(height: 20.0),
//           Column(
//             children: [
//               _buildSmallerContainer(),
//               const SizedBox(height: 10.0),
//               _buildSmallerContainer(),
//               const SizedBox(height: 10.0),
//               _buildSmallerContainer(),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

  Widget _buildSmallerContainer(Courses course) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 160.0,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Left side with image
          Container(
            padding: const EdgeInsets.all(10),
            width: 100.0,
            child: Image.network(course.courseimage),
          ),
          const SizedBox(width: 5.0), // Space between image and right side

          // Right side with columns for heading, subheading, and progress bar
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  course.fullnamedisplay,
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(
                    height: 10.0), // Space between subheading and container
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Container(
                    width: double.infinity,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(241, 221, 202, 1.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Soft Skills Enhancement Series',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(144, 105, 73, 1.0),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                    height: 10.0), // Space between container and progress bar
                Row(
                  children: [
                    Expanded(
                      child: LinearProgressIndicator(
                        value: course.progress / 100, // Adjust progress value
                        backgroundColor: Colors.grey,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Color.fromRGBO(144, 105, 73, 1.0),
                        ),
                      ),
                    ),
                    SizedBox(
                        width: 10), // Space between progress bar and percentage
                    Text(
                      '${course.progress}%',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
