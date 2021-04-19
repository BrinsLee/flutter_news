import 'package:flutter/material.dart';
import 'package:flutter_new/common/values/colors.dart';

/// Created by lipeilin
/// on 2021/2/11
Widget transparentAppBar({
  @required BuildContext context,
  String title,
  bool centerTitle,
  List<Widget> actions,
}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: centerTitle,
    title: Text(title,style: TextStyle(color: AppColors.primaryText),textAlign: TextAlign.center,),
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back_ios,
        color: AppColors.primaryText,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    actions: actions,
  );
}
