import 'package:flutter/material.dart';
import 'package:yoga/models/schedule.dart';
import 'package:yoga/ui/widgets/ui_helpers.dart';

// ignore: must_be_immutable
class ActivityTile extends StatelessWidget {
  final Activity activity;
  ActivityTile({this.activity});

  double iconSize = 17;

  Row subtitlerow() {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(Icons.arrow_upward,size: iconSize),
        largeHorizontalSpace(),
        Icon(Icons.favorite_border,size: iconSize,),
        largeHorizontalSpace(),
        Icon(Icons.alarm_add,size: iconSize,)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: ListTile(
          leading: Text(activity.time.toString()),
          title: Text(activity.title, style: TextStyle(fontSize: 16),),
          subtitle: Column(
            children: [
              smallVertSpace(),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  activity.description,
                  //style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
              smallVertSpace(),
              subtitlerow(),
              smallVertSpace(),
              Divider(height: 0.0),
              
            ],
          )
          //trailing: Icon(Icons.arrow_upward),
          ),
    );
  }
}
