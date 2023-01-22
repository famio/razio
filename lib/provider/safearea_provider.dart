import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final nativeSafeAreaProvider = StateProvider<EdgeInsets>(
  (ref) => EdgeInsets.zero,
);
