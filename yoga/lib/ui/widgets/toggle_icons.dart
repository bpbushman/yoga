
import 'package:flutter/material.dart';
const double iconSize = 18;

  Widget likeIcon(bool isLiked) {
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

  Widget alarmIcon(bool alarm) {
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

  Widget goingIcon(bool isGoing) {
    return isGoing
        ? Icon(
            Icons.arrow_upward,
            size: iconSize,
            color: Colors.green,
          )
        : Icon(Icons.arrow_upward_outlined, size: iconSize, color: Colors.grey);
  }