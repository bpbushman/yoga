import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:stacked/stacked.dart';
import 'package:yoga/app/locator.dart';
import 'package:yoga/ui/smart_widgets/appointment_tiles/appointment_tile.dart';
import 'package:yoga/ui/smart_widgets/schedule_tiles/activity_tile.dart';
import 'package:yoga/ui/views/schedule/schedule_view_model.dart';
import 'package:yoga/ui/widgets/strings.dart';
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
      fireOnModelReadyOnce: true,
      disposeViewModel: false,
      viewModelBuilder: () => locator<ScheduleViewModel>(),
      //initialiseSpecialViewModelsOnce: true,
      builder: (context, model, child) => model.isLoading
          ? loading()
          : Scrollbar(
            key: PageStorageKey('storage-key'),
              radius: Radius.circular(16),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    largeVertSpace(),
                    scrollingTitle(scheduleString),
                    mediumVertSpace(),
                    Card(
                      margin: EdgeInsets.fromLTRB(24, 0, 24, 0),
                      elevation: 3.0,
                      shape: appThemeRadius(),
                      child: SizedBox(
                        height: 368,
                        child: Expanded(
                          child: ListView.builder(
                            itemCount: model.classes.length,
                            itemBuilder: (context, index) =>
                                ActivityTile(activity: model.classes[index]),
                          ),
                        ),
                      ),
                    ),
                    mediumVertSpace(),
                    scrollingTitle(appointmentString),
                    mediumVertSpace(),
                    Container(
                      height: 152,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            AppointmentTile(),
                            AppointmentTile(),
                            AppointmentTile(),
                            AppointmentTile(),
                          ],
                        ),
                      ),
                    ),
                    mediumVertSpace(),
                    scrollingTitle(reviewsString),
                    mediumVertSpace()
                  ],
                ),
              ),
            ),
    );
  }
}
