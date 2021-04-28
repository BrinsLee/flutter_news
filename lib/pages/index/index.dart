
import 'package:flutter/material.dart';
import 'package:flutter_new/global.dart';
import 'package:flutter_new/pages/application/application.dart';
import 'package:flutter_new/pages/sign_in/sign_in.dart';
import 'package:flutter_new/pages/welcome/welcome.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();

  IndexPage({Key key}) : super(key: key);
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 375, height: 812 - 44 - 34, allowFontScaling: true);
    return Scaffold(
      body: Global.isFirstOpen
          ? WelcomePage()
          : Global.isOfflineLogin
              ? ApplicationPage()
              : SignInPage(),
    );
  }
}
