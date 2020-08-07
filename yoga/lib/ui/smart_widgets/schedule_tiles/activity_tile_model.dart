import 'package:stacked/stacked.dart';
//import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yoga/app/locator.dart';


//@lazySingleton
class ActivityTileModel extends BaseViewModel {
  final SnackbarService _snackbarService = locator<SnackbarService>();
  bool isLiked = false;
  bool alarm = false;
  bool isGoing = false;

  void toggleGoing() {
    isGoing = !isGoing;
    notifyListeners();
    if(isGoing) {
      _snackbarService.showSnackbar(
        message: 'going!', 
        duration: Duration(seconds: 3));
    }
  }

  void toggleAlarm() {
    alarm = !alarm;
    notifyListeners();
    if(alarm) {
      _snackbarService.showSnackbar(
        message: 'reminder set!', 
        duration: Duration(seconds: 3));
    }
  }

  void toggleLike() {
    isLiked = !isLiked;
    notifyListeners();
    if(isLiked) {
      _snackbarService.showSnackbar(
        message: 'added to favorites!', 
        duration: Duration(seconds: 3));
    }
  }
}