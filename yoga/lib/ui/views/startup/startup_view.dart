import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:yoga/ui/views/startup/startup_view_model.dart';

class StartUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => StartUpViewModel(),
      onModelReady:(model) => model.handleStartup(),
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: Text(model.title),
        ),
      ) 
    );
  }
}