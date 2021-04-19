import 'package:flutter/material.dart';

/// Created by lipeilin
/// on 2021/2/11

/// 邮箱验证
bool duIsEmail(String input) {
  if (input == null || input.isEmpty) return false;
  String regexEmail = "^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*\$";
  return RegExp(regexEmail).hasMatch(input);
}

/// 检查字符长度
bool duCheckStringLength(String input, int length) {
  if (input == null || input.isEmpty) return false;
  return input.length >= length;
}
