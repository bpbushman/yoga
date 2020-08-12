import 'package:flutter/material.dart';

class AppointmentTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(6, 0, 6, 0),
      child: Container(
        height: 152,
        width: 160,
        child: Card(
          elevation: 3.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Column(
            children: [
              Text(
                'Title',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Divider(
                height: 0.0,
              ),
              Text(
                'Description of the appointment, and other relevant info',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
              )
            ],
          ),
        ),
      ),
    );
  }
}
