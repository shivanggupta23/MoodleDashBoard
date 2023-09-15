List<Courses> courses = [];

class Courses {
  final int id;
  final String fullname;
  final String shortname;
  final String idnumber;
  final String summary;
  final int summaryformat;
  final int startdate;
  final int enddate;
  final bool visible;
  final bool showactivitydates;
  final bool showcompletionconditions;
  final String fullnamedisplay;
  final String viewurl;
  final String courseimage;
  final int progress;
  final bool hasprogress;
  final bool isfavourite;
  final bool hidden;
  final int timeaccess;
  final bool showshortname;
  final String coursecategory;

  Courses({
    required this.id,
    required this.fullname,
    required this.shortname,
    required this.idnumber,
    required this.summary,
    required this.summaryformat,
    required this.startdate,
    required this.enddate,
    required this.visible,
    required this.showactivitydates,
    required this.showcompletionconditions,
    required this.fullnamedisplay,
    required this.viewurl,
    required this.courseimage,
    required this.progress,
    required this.hasprogress,
    required this.isfavourite,
    required this.hidden,
    required this.timeaccess,
    required this.showshortname,
    required this.coursecategory,
  });

  factory Courses.fromJson(Map<String, dynamic> json) {
    return Courses(
      id: json['id'],
      fullname: json['fullname'],
      shortname: json['shortname'],
      idnumber: json['idnumber'],
      summary: json['summary'],
      summaryformat: json['summaryformat'],
      startdate: json['startdate'],
      enddate: json['enddate'],
      visible: json['visible'],
      showactivitydates: json['showactivitydates'],
      showcompletionconditions: json['showcompletionconditions'],
      fullnamedisplay: json['fullnamedisplay'],
      viewurl: json['viewurl'],
      courseimage: json['courseimage'],
      progress: json['progress'],
      hasprogress: json['hasprogress'],
      isfavourite: json['isfavourite'],
      hidden: json['hidden'],
      timeaccess: json['timeaccess'],
      showshortname: json['showshortname'],
      coursecategory: json['coursecategory'],
    );
  }
}
