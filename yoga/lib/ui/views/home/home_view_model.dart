import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yoga/app/locator.dart';
import 'package:yoga/app/router.gr.dart';
import 'package:yoga/services/authentication_service.dart';

class HomeViewModel extends IndexTrackingViewModel {
  final AuthenticationService _authenticationService = locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();
  
  String _title = 'Home View';
  String get title => _title;

  Future signOut() async {
    _authenticationService.signout();
    var isUserLoggedIn = await _authenticationService.isUserLoggedIn();
    if(isUserLoggedIn) {
      _navigationService.navigateTo(Routes.homeView);
    } else {
      _navigationService.navigateTo(Routes.loginView);
    }
  }
}