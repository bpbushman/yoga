import 'package:flutter/material.dart';
import 'package:yoga/ui/widgets/text_field.dart';
import 'package:yoga/ui/widgets/ui_helpers.dart';

class SignupView extends StatefulWidget {
  @override
  _SignupViewState createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _username;
  String _password;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Scaffold(
        body: Padding(
            padding: EdgeInsets.fromLTRB(24, 40, 24, 0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Signup',
                    style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                  ),
                ),
                largeVertSpace(),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      textField(
                          label: 'username',
                          message: 'username required',
                          function: (String value) {
                            _username = value;
                            print(_username);
                          }),
                      mediumVertSpace(),
                      textField(
                          label: 'password',
                          message: 'password required',
                          function: (String value) {
                            _password = value;
                            print(_password);
                          }),
                      mediumVertSpace(),
                      GestureDetector(
                        child: Text('Forgot Password',
                            style: TextStyle(color: Colors.blue)),
                      ),
                      smallVertSpace(),
                      RaisedButton(
                          child: Text('Login'),
                          onPressed: () {
                            if (!_formKey.currentState.validate()) {
                              return;
                            }
                            _formKey.currentState.save();
                          }),
                      largeVertSpace(),
                      Text('Don\'t have an account? Register with:'),
                      mediumVertSpace(),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                icon: Icon(Icons.email), onPressed:() {}),
                            mediumHorizontalSpace(),
                            IconButton(
                                icon: Icon(Icons.account_circle),
                                onPressed: () {}),
                          ])
                    ],
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}