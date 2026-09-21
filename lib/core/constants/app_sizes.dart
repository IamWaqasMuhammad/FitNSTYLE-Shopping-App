import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSizes {
  AppSizes._();

  // =========================================================
  // FONT SIZES (Raw doubles for typography tokens)
  // =========================================================
  static const double fontDisplayLarge = 32.0;
  static const double fontDisplayMedium = 28.0;

  static const double fontHeadingLarge = 24.0;
  static const double fontHeadingMedium = 20.0;
  static const double fontHeadingSmall = 18.0;

  static const double fontBodyLarge = 16.0;
  static const double fontBodyMedium = 14.0;
  static const double fontBodySmall = 12.0;

  static const double fontButton = 15.0;
  static const double fontCaption = 11.0;
  static const double fontLabelSmall = 10.0;

  // =========================================================
  // SPACING (Margins & Paddings)
  // =========================================================
  static double get xs => 4.0.r;
  static double get sm => 8.0.r;
  static double get md => 12.0.r;
  static double get lg => 16.0.r;
  static double get xl => 20.0.r;
  static double get xxl => 24.0.r;
  static double get xxxl => 32.0.r;

  static double get screenPadding => 16.0.w;
  static double get screenPaddingLarge => 24.0.w;

  // =========================================================
  // BORDER RADIUS
  // =========================================================
  static double get radiusXS => 4.0.r;
  static double get radiusSM => 8.0.r;
  static double get radiusMD => 12.0.r;
  static double get radiusLG => 16.0.r;
  static double get radiusXL => 20.0.r;
  static double get radiusXXL => 24.0.r;
  static double get radiusCircular => 100.0.r;

  // =========================================================
  // COMPONENT SPECIFIC
  // =========================================================
  static double get buttonHeight => 52.0.h;
  static double get buttonHeightSmall => 44.0.h;
  static double get buttonRadius => 12.0.r;

  static double get textFieldHeight => 52.0.h;
  static double get textFieldRadius => 12.0.r;

  static double get iconXS => 14.0.r;
  static double get iconSM => 18.0.r;
  static double get iconMD => 22.0.r;
  static double get iconLG => 28.0.r;
  static double get iconXL => 32.0.r;

  static double get productImageHeight => 220.0.h;
  static double get productImageRadius => 12.0.r;

  static double get appBarHeight => 56.0.h;
  static double get bottomNavHeight => 70.0.h;
  static double get dividerThickness => 1.0.h;
}
