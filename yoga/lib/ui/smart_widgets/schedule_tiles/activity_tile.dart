import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:yoga/models/schedule.dart';
import 'package:yoga/ui/smart_widgets/schedule_tiles/activity_tile_model.dart';
import 'package:yoga/ui/widgets/strings.dart';
import 'package:yoga/ui/widgets/ui_helpers.dart';

// ignore: must_be_immutable
class ActivityTile extends StatelessWidget {
  final Activity activity;
  ActivityTile({this.activity});

  double iconSize = 18;

  likeIcon(bool isLiked) {
    return isLiked
        ? Icon(
            Icons.favorite,
            color: Colors.red,
            size: iconSize,
          )
        : Icon(
            Icons.favorite_border,
            color: Colors.red,
            size: iconSize,
          );
  }

  alarmIcon(bool alarm) {
    return alarm
        ? Icon(
            Icons.alarm_on,
            size: iconSize,
            color: Colors.blue,
          )
        : Icon(
            Icons.alarm_add_outlined,
            size: iconSize,
            color: Colors.grey,
          );
  }

  goingIcon(bool isGoing) {
    return isGoing
        ? Icon(
            Icons.arrow_upward,
            size: iconSize,
            color: Colors.green,
          )
        : Icon(Icons.arrow_upward_outlined, size: iconSize, color: Colors.grey);
  }

  Row subtitlerow(bool isLiked, Function likeFunction, bool alarm,
      Function alarmFunction, bool isGoing, Function goingFunction) {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          child: likeIcon(isLiked),
          onTap: likeFunction,
        ),
        largeHorizontalSpace(),
        GestureDetector(
          child: goingIcon(isGoing),
          onTap: goingFunction,
        ),
        largeHorizontalSpace(),
        GestureDetector(
          child: alarmIcon(alarm),
          onTap: alarmFunction,
        ),
      ],
    );
  }

  String timefromTimeStamp(Timestamp timestamp, context) {
    var dateTime = timestamp.toDate();
    var time = TimeOfDay.fromDateTime(dateTime);
    return time.format(context);
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        disposeViewModel: false,
        builder: (context, model, child) => Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: ListTile(
                leading:timeText(timefromTimeStamp(activity.timeStamp, context)),  
                title: titleText(activity.title),
                subtitle: Column(
                  children: [
                    smallVertSpace(),
                    descriptionText(activity.description),
                    smallVertSpace(),
                    subtitlerow(
                        model.isLiked,
                        () => model.toggleLike(),
                        model.alarm,
                        () => model.toggleAlarm(),
                        model.isGoing,
                        () => model.toggleGoing()),
                    smallVertSpace(),
                    Divider(height: 0.0),
                  ],
                ),
              ),
            ),
        viewModelBuilder: () => ActivityTileModel());
  }
}
