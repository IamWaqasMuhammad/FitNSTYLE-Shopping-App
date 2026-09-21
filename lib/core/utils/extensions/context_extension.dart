import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  /// Returns the screen width using MediaQuery
  double get screenWidth => MediaQuery.of(this).size.width;

  /// Returns the screen height using MediaQuery
  double get screenHeight => MediaQuery.of(this).size.height;
}
