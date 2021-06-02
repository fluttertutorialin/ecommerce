/*
   DEVELOPED BY: KAMLESH LAKHANI
   FOR TEXT STYLE
*/

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../import_package.dart';

class AppTextStyle {
  const AppTextStyle._();

  static final TextStyle _textStyle = GoogleFonts.notoSans(
      fontStyle: FontStyle.normal, fontSize: Dimens.fontSize16);

  static final TextStyle semiBoldStyle = _textStyle.copyWith(
    fontSize: Dimens.fontSize16,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle boldStyle = _textStyle.copyWith(
    fontSize: Dimens.fontSize22,
    fontWeight: FontWeight.w700,
  );

  static final TextStyle regularStyle = GoogleFonts.notoSans(
      fontStyle: FontStyle.normal, fontSize: Dimens.fontSize18);

  static final TextStyle buttonTextStyle = _textStyle.copyWith(
    fontSize: Dimens.fontSize16,
    color: Colors.white
  );

  static final TextStyle appBarTitleStyle =
      _textStyle.copyWith(fontSize: Dimens.fontSize18);

  static final TextStyle splashTitleStyle = GoogleFonts.notoSans(
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold,
      fontSize: Dimens.fontSize30);

  static final TextStyle textFieldStyle =
      GoogleFonts.notoSans(fontSize: Dimens.fontSize16);

  static final TextStyle doNotHaveAccountStyle = _textStyle.copyWith(fontSize: Dimens.fontSize14);
  static final TextStyle signUpStyle = semiBoldStyle.copyWith(fontSize: Dimens.fontSize14, color: AppColors.kPrimaryColor);
}
