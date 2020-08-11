import 'package:cloud_firestore/cloud_firestore.dart';

class Activity {
  final String title;
  final String description;
  final int time;
  List<String> days;
  Timestamp timeStamp;

  Activity({this.days, this.description, this.time, this.title});

  Activity.fromJson(Map<String, dynamic> data)
      : title = data['title'],
        description = data['description'],
        timeStamp = data['timeStamp'],
        time = data['time'];
        //days = data['days'];

  Map<String, dynamic> toJson() =>
      {'title': title, 'description': description, 'time': time, 'days': days};
}
