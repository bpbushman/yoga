// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';

import '../ui/smart_widgets/schedule_tiles/activity_tile_model.dart';
import '../services/authentication_service.dart';
import '../services/firestore_service.dart';
import '../ui/views/schedule/schedule_view_model.dart';
import '../services/third_party_services_module.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  final thirdPartyServicesModule = _$ThirdPartyServicesModule();
  gh.lazySingleton<ActivityTileModel>(() => ActivityTileModel());
  gh.lazySingleton<AuthenticationService>(() => AuthenticationService());
  gh.lazySingleton<DialogService>(() => thirdPartyServicesModule.dialogService);
  gh.lazySingleton<FirestoreService>(() => FirestoreService());
  gh.lazySingleton<NavigationService>(
      () => thirdPartyServicesModule.navigationService);
  gh.lazySingleton<ScheduleViewModel>(() => ScheduleViewModel());
  gh.lazySingleton<SnackbarService>(
      () => thirdPartyServicesModule.snackBarService);
  return get;
}

class _$ThirdPartyServicesModule extends ThirdPartyServicesModule {
  @override
  DialogService get dialogService => DialogService();
  @override
  NavigationService get navigationService => NavigationService();
  @override
  SnackbarService get snackBarService => SnackbarService();
}
