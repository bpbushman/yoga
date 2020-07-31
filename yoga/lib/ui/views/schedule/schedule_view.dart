import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:yoga/models/schedule.dart';
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
    return ViewModelBuilder.reactive(
      onModelReady: (model) => model.listenToSchedule(),
      disposeViewModel: false,
      viewModelBuilder: () => ScheduleViewModel(),
      builder: (context, model, child) => model.isLoading
          ? loading()
          : Padding(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Column(
                children: [
                  Align(alignment: Alignment.centerLeft,
                    child: Text(' Schedule', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                  ),
                  
                  smallVertSpace(),
                  Card(
                    elevation: 2.5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: SizedBox(
                      height: 306,
                      child: Expanded(
                        child: ListView.builder(
                            itemCount: model.classes.length,
                            itemBuilder: (context, index) {
                              return ActivityTile(
                                  activity: model.classes[index]);
                            }),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

class ActivityTile extends StatelessWidget {
  final Activity activity;
  ActivityTile({this.activity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: ListTile(
        leading: Text(activity.time.toString()),
        title: Text(activity.title),
        subtitle: Text(activity.description),
      ),
    );
  }
}
