import 'package:stacked/stacked.dart';
import 'package:yoga/app/locator.dart';
import 'package:yoga/services/authentication_service.dart';

class LoginViewModel extends BaseViewModel {
  final AuthenticationService _authService = locator<AuthenticationService>();

  void signIn() {
    print(_authService.currentUser);
    _authService.googleSignIn();
  }
}