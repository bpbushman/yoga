import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:yoga/app/locator.dart';
import 'package:yoga/ui/smart_widgets/schedule_tiles/activity_tile.dart';
import 'package:yoga/ui/views/schedule/schedule_view_model.dart';
import 'package:yoga/ui/widgets/ui_helpers.dart';

class ScheduleView extends StatelessWidget {
  loading() {
    return Center(
      child: Text('Loading...'),
    );
  }

  @override
  Widget build(BuildContext context) {
    print('schedule view built');
    return ViewModelBuilder<ScheduleViewModel>.reactive(
      onModelReady: (model) => model.listenToSchedule(),
      disposeViewModel: false,
      viewModelBuilder: () => locator<ScheduleViewModel>(),
      initialiseSpecialViewModelsOnce: true,
      builder: (context, model, child) => model.isLoading
          ? loading()
          : SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Schedule',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                  ),
                  smallVertSpace(),
                  Card(
                    elevation: 3.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    child: SizedBox(
                      height: 344,
                      child: Expanded(
                        child: ListView.builder(
                          itemCount: model.classes.length,
                          itemBuilder: (context, index) =>
                              ActivityTile(activity: model.classes[index]),
                        ),
                      ),
                    ),
                  ),
                  smallVertSpace(),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Make an appointment',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                  ),
                  largeVertSpace(),
                ],
              ),
            ),
          ),
    );
  }
}
