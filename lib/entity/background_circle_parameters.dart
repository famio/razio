import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'background_circle_parameters.freezed.dart';

@freezed
class BackgroundCircleParameters with _$BackgroundCircleParameters {
  const factory BackgroundCircleParameters({
    required double opacity,
    required Offset position,
  }) = _BackgroundCircleParameters;
}
