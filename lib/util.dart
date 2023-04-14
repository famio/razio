import 'dart:convert';
import 'dart:math' as math;

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';

bool isLightMode(BuildContext context) {
  final brightness = MediaQuery.platformBrightnessOf(context);
  return brightness == Brightness.light;
}

String generateUid() {
  final random = math.Random().nextDouble() * 1000000000;
  final diff = DateTime.now().difference(DateTime.utc(1970)).inSeconds * 1000;
  return md5
      .convert(utf8.encode((random.toInt() + diff).toString()))
      .toString();
}
