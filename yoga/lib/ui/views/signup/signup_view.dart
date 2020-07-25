import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:yoga/ui/views/signup/signup_view_model.dart';
import 'package:yoga/ui/widgets/text_field.dart';
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
                          style: TextStyle(
                              fontSize: 48, fontWeight: FontWeight.bold),
                        ),
                      ),
                      largeVertSpace(),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            textField(
                                label: 'email',
                                message: 'email required',
                                function: (String value) {
                                  _email = value;
                                }),
                            mediumVertSpace(),
                            textField(
                                label: 'password',
                                message: 'password required',
                                function: (String value) {
                                  _password = value;
                                }),
                            largeVertSpace(),
                            RaisedButton(
                                child: Text('submit'),
                                onPressed: () {
                                  if (!_formKey.currentState.validate()) {
                                    return null;
                                  }
                                  _formKey.currentState.save();
                                  model.signUp(email: _email, password: _password);
                                }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        viewModelBuilder: () => SignupViewModel());
  }
}
