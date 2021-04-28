import 'package:flutter/material.dart';

/// provider 创建响应数据类
class AppState with ChangeNotifier {
  bool _isGrayFilter;

  bool get isGrayFilter => _isGrayFilter;

  AppState({bool isGrayFilter = false}) {
    this._isGrayFilter = isGrayFilter;
  }

  // 切换灰色滤镜
  /// provider 通知数据发生变化
  switchGrayFilter() {
    _isGrayFilter = !_isGrayFilter;
    notifyListeners();
  }
}
