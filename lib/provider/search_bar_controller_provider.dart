import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final Provider<TextEditingController> searchBarControllerProvider =
    Provider((ref) => TextEditingController());
