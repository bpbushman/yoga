import 'package:flutter/material.dart';
import 'package:yoga/ui/widgets/text_field.dart';
import 'package:yoga/ui/widgets/ui_helpers.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _username;
  String _password;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.fromLTRB(16, 40, 16, 0),
          child: Column(
            children: [
              Text(
                'Welcome',
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
              mediumVertSpace(),
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
                    RaisedButton(
                        child: Text('Login'),
                        onPressed: () {
                          if (!_formKey.currentState.validate()) {
                            return;
                          }
                          _formKey.currentState.save();
                        })
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
