import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_new/common/entity/entitys.dart';
import 'package:flutter_new/common/provider/provider.dart';
import 'package:flutter_new/common/utils/http.dart';
import 'package:flutter_new/common/utils/storage.dart';
import 'common/values/storage.dart';

/// 全局配置
class Global {
  /// 是否第一次打开
  static bool isFirstOpen = false;

  /// 是否离线登录
  static bool isOfflineLogin = false;

  /// 用户配置
  static UserResponseEntity profile = UserResponseEntity(accessToken: null);

  /// 是否release
  static bool get isRelease => bool.fromEnvironment("dart.vm.product");

  /// 应用状态 provider初始响应数据。方式一，先创建数据对象再挂载
  static AppState appState = AppState();
  /// init
  static Future init() async {
    // 初始化运行
    WidgetsFlutterBinding.ensureInitialized();

    // 工具类初始化
    await StorageUtil.init();
    HttpUtil();

    // 读取设备第一次打开
    isFirstOpen = !StorageUtil().getBool(STORAGE_DEVICE_ALREADY_OPEN_KEY);
    if (isFirstOpen) {
      StorageUtil().setBool(STORAGE_DEVICE_ALREADY_OPEN_KEY, true);
    }
    var _profileJSON = StorageUtil().getJSON(STORAGE_USER_PROFILE_KEY);
    if (_profileJSON != null) {
      profile = UserResponseEntity.fromJson(_profileJSON);
      isOfflineLogin = true;
    }

    if(Platform.isAndroid) {
      SystemUiOverlayStyle systemUiOverlayStyle =
      SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  }

  static Future<bool> saveProfile(UserResponseEntity responseEntity) {
    profile = responseEntity;
    return StorageUtil().setJSON(STORAGE_USER_PROFILE_KEY, responseEntity.toJson());
  }
}
