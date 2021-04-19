import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_new/common/entity/entitys.dart';
import 'package:flutter_new/common/utils/http.dart';
import 'package:flutter_new/common/utils/storage.dart';

import 'common/values/storage.dart';

/// 全局配置
class Global {
  /// 用户配置
  static UserResponseEntity profile = UserResponseEntity(accessToken: null);

  /// 是否离线登录
  static bool isOfflineLogin = false;
  /// 是否release
  static bool get isRelease => bool.fromEnvironment("dart.vm.product");

  /// init
  static Future init() async {
    // 初始化运行
    WidgetsFlutterBinding.ensureInitialized();

    // 工具类初始化
    await StorageUtil.init();
    HttpUtil();

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
