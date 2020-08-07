import 'package:stacked/stacked.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yoga/app/locator.dart';
import 'package:yoga/services/authentication_service.dart';
import 'package:yoga/services/firestore_service.dart';


@lazySingleton
class ActivityTileModel extends BaseViewModel {
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final DialogService _dialogService = locator<DialogService>();
  final AuthenticationService _authenticationService = locator<AuthenticationService>();

  String uid; 

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

  void toggleLike(String activity) {
    uid = _authenticationService.currentUser.uid;
    isLiked = !isLiked;
    notifyListeners();
    var result = _firestoreService.setFavorite(uid, activity);
    if (result is String) {
      _dialogService.showDialog(
        title: 'Favorite Failed',
        description: 'unable to set as favorite'
      );
    }
    if(isLiked) {
      _snackbarService.showSnackbar(
        message: 'added to favorites!', 
        duration: Duration(seconds: 3));
    }
  }
}