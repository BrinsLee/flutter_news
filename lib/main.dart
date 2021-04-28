import 'package:flutter/material.dart';
import 'package:flutter_new/common/provider/app.dart';
import 'package:flutter_new/global.dart';
import 'package:flutter_new/pages/index/index.dart';
import 'package:flutter_new/pages/welcome/welcome.dart';
import 'package:flutter_new/routes.dart';
import 'package:provider/provider.dart';

// void main() => Global.init().then((value) => runApp(MyApp()));
/// provider 初始化方式一，先创建数据对象，再挂载
void main() => Global.init().then((value) => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<AppState>.value(value: Global.appState)
      ],
      /// provider 接收数据变化 方式一 Consumer，做出响应
      child: Consumer<AppState>(
        builder: (context, appState, _) {
          if (appState.isGrayFilter) {
            return ColorFiltered(
              colorFilter: ColorFilter.mode(Colors.white, BlendMode.color),
              child: MyApp(),
            );
          } else {
            return MyApp();
          }
        },
      ),
    )));

/*
  provider 方式二，挂载时，创建对象
  void main() => Global.init().then((value) => runApp(MultiProvider(providers: [
      ChangeNotifierProvider<AppState>(create: (_) => new AppState())
    ])));*/

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Material App",
      routes: staticRoutes,
      home: IndexPage(),
    );
  }
}
