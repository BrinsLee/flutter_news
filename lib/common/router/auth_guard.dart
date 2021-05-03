import 'package:auto_route/auto_route.dart';
import 'package:flutter_new/common/router/router.gr.dart';
import 'package:flutter_new/common/utils/utils.dart';

class AuthGuard extends RouteGuard {
  @override
  Future<bool> canNavigate(ExtendedNavigatorState<RouterBase> navigator,
      String routeName, Object arguments) async {
    var isAuth = await isAuthenticated();
    if (isAuth == false) {
      ExtendedNavigator.root.push(Routes.signInPage);
    }
    return isAuth;
  }
}
