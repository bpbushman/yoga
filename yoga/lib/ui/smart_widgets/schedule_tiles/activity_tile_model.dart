import 'package:stacked/stacked.dart';

class ActivityTileModel extends BaseViewModel {
  bool isLiked = false;
  bool alarm = false;
  bool isGoing = false;

  void toggleGoing() {
    isGoing = !isGoing;
    notifyListeners();
  }

  void toggleAlarm() {
    alarm = !alarm;
    notifyListeners();
  }

  void toggleLike() {
    isLiked = !isLiked;
    notifyListeners();
  }
}