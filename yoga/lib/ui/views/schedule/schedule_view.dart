import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:yoga/ui/views/schedule/schedule_view_model.dart';

class ScheduleView extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    
    return ViewModelBuilder.reactive(
      onModelReady: (model) => model.addClassesToFirebase(),
      disposeViewModel: false,
      viewModelBuilder: () => ScheduleViewModel(),
      builder: (context, model, child) => Center(child: Text('Schedule page'),)
    );
  }
}