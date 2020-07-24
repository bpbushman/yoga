import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yoga/app/locator.dart';
import 'package:yoga/app/router.gr.dart';
import 'package:yoga/services/authentication_service.dart';

class LoginViewModel extends BaseViewModel {
  final AuthenticationService _authService = locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();

  void signIn() {
    print(_authService.currentUser);
    _authService.googleSignIn();
  }

  Future navigateTosignup() async {
    await _navigationService.navigateTo(Routes.signupView);
  }
}