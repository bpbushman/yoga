import 'package:flutter/material.dart';

Widget textField({String label, String message, Function function}) {
  return Container(//color: Colors.grey[100],
    decoration: BoxDecoration(
      //border: 
    ),
    child: TextFormField(
      decoration: InputDecoration(labelText: label),
      validator: (String value) {
        if (value.isEmpty) {
          return message;
        }
        return 'good';
      },
      onSaved: function,
    ),
  );
}
