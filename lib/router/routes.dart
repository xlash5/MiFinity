import 'package:auto_route/auto_route.dart';
import '../screens/dice.dart';
import '../screens/history.dart';
import '../screens/home.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: Home, initial: true),
    AutoRoute(page: Dice),
    AutoRoute(page: History),
  ],
)
class $AppRouter {}
