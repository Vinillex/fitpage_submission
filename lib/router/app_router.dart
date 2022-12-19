import 'package:auto_route/auto_route.dart';
import 'package:fitpage_submission/screens/details_screen.dart';

import '../screens/home_screen.dart';
import '../screens/variable_screen.dart';

// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter
@CustomAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    CustomRoute(
      initial: true,
      page: HomeScreen,
    ),
    CustomRoute(
      page: CriteriaScreen,
    ),
    CustomRoute(
      page: VariableScreen,
    ),
    RedirectRoute(path: '*', redirectTo: ''),
  ],
)
class $AppRouter {}
