/*
   DEVELOPED BY: KAMLESH LAKHANI
   FOR TEXT STYLE
*/

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../import_package.dart';

class AppTextStyle {
  const AppTextStyle._();

  static final TextStyle semiBoldStyle = _textStyle.copyWith(
    fontSize: Dimens.fontSize16,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle boldStyle = _textStyle.copyWith(
    fontSize: Dimens.fontSize22,
    fontWeight: FontWeight.w700,
  );

  static final TextStyle regularStyle = GoogleFonts.lato(fontStyle: FontStyle.normal, fontSize: Dimens.fontSize18);

  static final TextStyle buttonTextStyle = _textStyle.copyWith(
    fontSize: Dimens.fontSize16,
    fontWeight: FontWeight.w700,
  );

  static final TextStyle _textStyle = TextStyle(
    color: Colors.black,
    fontSize: Dimens.fontSize14,
  );

  static final TextStyle appBarTitleStyle = _textStyle.copyWith(
    fontSize: Dimens.fontSize22,
    fontWeight: FontWeight.w700,
  );

  static final TextStyle splashTitleStyle = _textStyle.copyWith(
    fontSize: Dimens.fontSize22,
    fontWeight: FontWeight.w700,
  );

  static final TextStyle textFieldStyle = GoogleFonts.lato(fontStyle: FontStyle.normal, fontSize: Dimens.fontSize16);

}
