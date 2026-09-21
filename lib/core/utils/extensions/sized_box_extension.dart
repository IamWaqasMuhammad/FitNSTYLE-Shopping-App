import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension SizedBoxExtension on num {
  /// Vertical spacing: Creates a SizedBox with a responsive height (.h)
  SizedBox get height => SizedBox(height: h);

  /// Horizontal spacing: Creates a SizedBox with a responsive width (.w)
  SizedBox get width => SizedBox(width: w);
}
