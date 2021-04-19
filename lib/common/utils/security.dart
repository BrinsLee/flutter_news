import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';

/// Created by lipeilin 
/// on 2021/2/13
String duSHA256(String input) {
  String salt = "EIpWsyfiy@R@X#qn17!StJNdZK1fFF8iV6ffN!goZkqt#JxO";
  var bytes = utf8.encode(salt);
  var digest = sha256.convert(bytes);
  return digest.toString();
}