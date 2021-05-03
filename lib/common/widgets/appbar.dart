import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_new/common/utils/screen.dart';
import 'package:flutter_new/common/values/colors.dart';
import 'package:pk_skeleton/pk_skeleton.dart';

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
    title: Text(
      title,
      style: TextStyle(
          color: AppColors.primaryText,
          fontFamily: 'Montserrat',
          fontSize: duSetFontSize(18.0),
          fontWeight: FontWeight.w600),
      textAlign: TextAlign.center,
    ),
    leading: IconButton(
      icon: Icon(
        Icons.more_horiz,
        color: AppColors.primaryText,
      ),
      onPressed: () {
        // Navigator.pop(context);
      },
    ),
    actions: actions,
  );
}

/// 骨架屏-卡片
Widget cardListSkeleton() {
  return PKCardListSkeleton(
    isCircularImage: true,
    isBottomLinesActive: false,
    length: 10,
  );
}
