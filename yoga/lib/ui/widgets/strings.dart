import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//********************************************************//
//ScheduleView titles, strings, and Text widgets and style
//********************************************************//

const String scheduleString = "Schedule";
const String appointmentString = "Make an Appointment";
const String reviewsString = "Reviews";

Text scrollingTitle(String title) {
  return Text(title,
      style: GoogleFonts.rubik(
        textStyle: TextStyle(
          fontSize: 24,
          //fontWeight: FontWeight.bold,
        ),
      ));
}

//********************************************************//
//ActivityTile titles, strings, and Text widgets and style
//********************************************************//

Text timeText(String time) {
  return Text(
    time,
    style: GoogleFonts.lato(
        textStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
  );
}

Text titleText(String titleText) {
  return Text(
    titleText,
    style: GoogleFonts.lato(
        textStyle: TextStyle(
          fontSize: 16,
          color: Colors.black
        ),
      )
  );
}

Align descriptionText(descriptionText) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Text(
      descriptionText,
     style: GoogleFonts.lato(
        textStyle: TextStyle(
          fontSize: 14,
          color: Colors.grey
        ),
      )
    ),
  );
}
