import 'package:flutter/material.dart';

Widget textField({String label, String message, Function function}) {
  return Container(
    //color: Colors.grey[100],
    child: TextFormField(
      decoration: InputDecoration(
        labelText: label,
        fillColor: Colors.grey[100],
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.black)),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return message;
        }
        return 'look\'s good';
      },
      onSaved: function,
    ),
  );
}
