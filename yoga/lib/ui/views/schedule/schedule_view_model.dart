import 'package:stacked/stacked.dart';
//import 'package:stacked_services/stacked_services.dart';
import 'package:yoga/app/locator.dart';
import 'package:yoga/models/schedule.dart';
import 'package:yoga/services/firestore_service.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ScheduleViewModel extends BaseViewModel {
  final FirestoreService _firestoreService = locator<FirestoreService>();
  //final DialogService _dialogService = locator<DialogService>();
  List<Activity> _classes;
  List<Activity> get classes => _classes;

  bool isLoading = true;
  

  void listenToSchedule() {
    isLoading = true;
    _firestoreService.listenToClasses().listen((classData) {
      List<Activity> updatedClasses = classData;
      if(updatedClasses != null && updatedClasses.length > 0) {
        _classes = updatedClasses;
        //_classes.
        isLoading = false;
        notifyListeners();
      }
     });
  }
}






/*
List<Activity> classList = [
    Activity(title: 'yoga class', description: 'class for the masses', time: 0800, days:['monday', 'wednesday']),
    Activity(title: 'cat yoga', description: 'class for cats', time: 0900, days:['tuesday', 'thursday']),
    Activity(title: 'goat yoga', description: 'goat instructor', time: 1000, days:['wednesday', 'friday']),
    Activity(title: 'RPG yoga', description: 'lord of the rings', time: 1100, days:['thursday', 'friday']),
  ];
  
  addClassesToFirebase() {
    classList.forEach((element) {_addClass(element);});
  }

  Future _addClass(Activity activity) async {
    var result = await _firestoreService.addClass(activity);
    if(result is String) {
      await _dialogService.showDialog(
        title: 'could not add class',
        description: result
      );
    }
  }
*/