import 'package:flutter/material.dart';
import 'package:yoga/ui/widgets/text_field.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _username;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.fromLTRB(16, 40, 0, 0),
          child: Column(
            children: [
              Text(
                'Welcome',
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
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
                    TextFormField(
                      decoration: InputDecoration(labelText: 'password'),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'password required';
                        }
                        return 'good';
                      },
                      onSaved: (String value) {
                        _username = value;
                        print(_username);
                      },
                    ),
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
