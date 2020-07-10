import 'package:auto_route/auto_route_annotations.dart';
import 'package:twitter_desktop/ui/screens/home/screen.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(page: HomeScreen, initial: true),
  ],
)
class $Router {}
