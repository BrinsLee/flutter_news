// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../pages/application/application.dart';
import '../../pages/details/details.dart';
import '../../pages/index/index.dart';
import '../../pages/sign_in/sign_in.dart';
import '../../pages/sign_up/sign_up.dart';
import '../../pages/welcome/welcome.dart';
import 'auth_guard.dart';

class Routes {
  static const String indexPage = '/';
  static const String welcomePage = '/welcome-page';
  static const String signInPage = '/sign-in-page';
  static const String signUpPage = '/sign-up-page';
  static const String applicationPage = '/application-page';
  static const String detailPage = '/detail-page';
  static const all = <String>{
    indexPage,
    welcomePage,
    signInPage,
    signUpPage,
    applicationPage,
    detailPage,
  };
}

class AppRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.indexPage, page: IndexPage),
    RouteDef(Routes.welcomePage, page: WelcomePage),
    RouteDef(Routes.signInPage, page: SignInPage),
    RouteDef(Routes.signUpPage, page: SignUpPage),
    RouteDef(Routes.applicationPage, page: ApplicationPage),
    RouteDef(Routes.detailPage, page: DetailPage, guards: [AuthGuard]),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    IndexPage: (data) {
      final args = data.getArgs<IndexPageArguments>(
        orElse: () => IndexPageArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => IndexPage(key: args.key),
        settings: data,
      );
    },
    WelcomePage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const WelcomePage(),
        settings: data,
      );
    },
    SignInPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SignInPage(),
        settings: data,
      );
    },
    SignUpPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SignUpPage(),
        settings: data,
      );
    },
    ApplicationPage: (data) {
      final args = data.getArgs<ApplicationPageArguments>(
        orElse: () => ApplicationPageArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => ApplicationPage(key: args.key),
        settings: data,
      );
    },
    DetailPage: (data) {
      final args = data.getArgs<DetailPageArguments>(
        orElse: () => DetailPageArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => DetailPage(
          key: args.key,
          title: args.title,
          url: args.url,
        ),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// IndexPage arguments holder class
class IndexPageArguments {
  final Key key;
  IndexPageArguments({this.key});
}

/// ApplicationPage arguments holder class
class ApplicationPageArguments {
  final Key key;
  ApplicationPageArguments({this.key});
}

/// DetailPage arguments holder class
class DetailPageArguments {
  final Key key;
  final String title;
  final String url;
  DetailPageArguments({this.key, this.title, this.url});
}
