import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yoga/app/locator.dart';
import 'package:yoga/app/router.gr.dart';
import 'package:yoga/services/authentication_service.dart';

class StartUpViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final AuthenticationService _authenticationService = locator<AuthenticationService>();

  String _title = 'Welcome';
  String get title => _title;

  Future handleStartup() async {
    print('handleStartup executed');
    var isUserLoggedIn = await _authenticationService.isUserLoggedIn();
    if(isUserLoggedIn) {
      _navigationService.navigateTo(Routes.homeView);
    } else {
      _navigationService.navigateTo(Routes.loginView);
    }

  }
}