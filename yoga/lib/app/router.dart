import 'package:auto_route/auto_route_annotations.dart';
import 'package:yoga/ui/views/home/home_view.dart';
import 'package:yoga/ui/views/startup/startup_view.dart';

@MaterialAutoRouter(
routes: <AutoRoute>[
  MaterialRoute(page: HomeView, initial: false),
  MaterialRoute(page: StartUpView, initial: true),
])
class $Router {}
  //@initial
  
