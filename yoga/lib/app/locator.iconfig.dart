// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:yoga/services/authentication_service.dart';
import 'package:yoga/services/third_party_services_module.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yoga/services/firestore_service.dart';
import 'package:yoga/ui/views/schedule/schedule_view_model.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  final thirdPartyServicesModule = _$ThirdPartyServicesModule();
  g.registerLazySingleton<AuthenticationService>(() => AuthenticationService());
  g.registerLazySingleton<DialogService>(
      () => thirdPartyServicesModule.dialogService);
  g.registerLazySingleton<FirestoreService>(() => FirestoreService());
  g.registerLazySingleton<NavigationService>(
      () => thirdPartyServicesModule.navigationService);
  g.registerLazySingleton<ScheduleViewModel>(() => ScheduleViewModel());
  g.registerLazySingleton<SnackbarService>(
      () => thirdPartyServicesModule.snackBarService);
}

class _$ThirdPartyServicesModule extends ThirdPartyServicesModule {
  @override
  DialogService get dialogService => DialogService();
  @override
  NavigationService get navigationService => NavigationService();
  @override
  SnackbarService get snackBarService => SnackbarService();
}
