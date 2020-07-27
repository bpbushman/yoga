import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:yoga/ui/views/signup/signup_view_model.dart';
import 'package:yoga/ui/widgets/ui_helpers.dart';

class SignupView extends StatefulWidget {
  @override
  _SignupViewState createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _password;
  String _email;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => SignupViewModel(),
      builder: (context, model, child) => ClipRRect(
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
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'email',
                          fillColor: Colors.grey[100],
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Colors.black)),
                        ),
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'email is required';
                          }
                          return null;
                        },
                        onSaved: (value) => _email = value,
                      ),
                      mediumVertSpace(),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'password',
                          fillColor: Colors.grey[100],
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Colors.black)),
                        ),
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'password is required';
                          }
                          return null;
                        },
                        onSaved: (value) => _password = value,
                      ),
                      largeVertSpace(),
                      RaisedButton(
                          child: Text('submit'),
                          onPressed: () {
                            print(_email);
                            if (_formKey.currentState.validate()) {
                              _formKey.currentState.save();
                              print('$_email from if');
                              model.signUp(_email, _password);
                              return null;
                            }
                            print('$_email from else');
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
