import 'package:flutter/material.dart';
import 'package:flutter_new/common/entity/entitys.dart';
import 'package:flutter_new/common/utils/utils.dart';

/// Created by lipeilin
/// on 2021/2/13
/// 用户
class UserApi {
  // 登录
  static Future<UserResponseEntity> login(
      {@required BuildContext context, UserRequestEntity params}) async {
    var response =
        await HttpUtil().post('/user/login', context: context, params: params);
    return UserResponseEntity.fromJson(response);
  }
}
