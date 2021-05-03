import 'package:auto_route/auto_route_annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_new/common/router/auth_guard.dart';
import 'package:flutter_new/pages/application/application.dart';
import 'package:flutter_new/pages/details/details.dart';
import 'package:flutter_new/pages/index/index.dart';
import 'package:flutter_new/pages/sign_in/sign_in.dart';
import 'package:flutter_new/pages/sign_up/sign_up.dart';
import 'package:flutter_new/pages/welcome/welcome.dart';

Widget zoomInTransition(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) {
  return ScaleTransition(
    scale: animation,
    child: child,
  );
}

@MaterialAutoRouter(routes: [
  MaterialRoute(page: IndexPage, initial: true),
  MaterialRoute(page: WelcomePage),
  MaterialRoute(page: SignInPage),
  MaterialRoute(page: SignUpPage),
  MaterialRoute(page: ApplicationPage),
  MaterialRoute(page: DetailPage, guards: [AuthGuard]),
])
@CustomRoute(page: DetailPage, transitionsBuilder: zoomInTransition)
class $AppRouter {}
