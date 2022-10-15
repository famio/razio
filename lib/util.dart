import 'package:flutter/material.dart';

bool isLightMode(BuildContext context) {
  final brightness = MediaQuery.platformBrightnessOf(context);
  return brightness == Brightness.light;
}
