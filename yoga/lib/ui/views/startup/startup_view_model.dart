import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yoga/app/locator.dart';
import 'package:yoga/app/router.gr.dart';

class StartUpViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  String _title = 'StartUp view';
  String get title => _title;

  Future navigateHome() async {
    await _navigationService.navigateTo(Routes.loginView);
  }
}