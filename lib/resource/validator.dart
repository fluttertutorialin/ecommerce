import '../../import_package.dart';

class Validator {
  const Validator._();

  static String? validateEmpty(String? v) {
    if (v!.isEmpty) {
      return ValueString.fieldCantBeEmpty;
    } else {
      return null;
    }
  }

  static String? validateUserName(String? v) {
    if (v!.isEmpty) {
      return ValueString.userNameCantBeEmpty;
    } else if (!GetUtils.isUsername(v)) {
      return ValueString.enterValidUserName;
    } else {
      return null;
    }
  }

  static String? validateEmail(String? v) {
    if (v!.isEmpty) {
      return ValueString.emailCantBeEmpty;
    } else if (!GetUtils.isEmail(v)) {
      return ValueString.enterValidEmail;
    } else {
      return null;
    }
  }

  static String? validatePassword(String? v) {
    if (v!.isEmpty) {
      return ValueString.passwordCantBeEmpty;
    } else if (v.length < 8) {
      return ValueString.enterValidPassword;
    } else {
      return null;
    }
  }

  static String? validateMobile(String? v) {
    if (v!.isEmpty) {
      return ValueString.mobileCantBeEmpty;
    } else if (v.length < 10) {
      return ValueString.enterValidMobile;
    } else {
      return null;
    }
  }

/*
  static String? validateDropDownEmpty<T>(T? v) {
    if (v == null) {
      return Strings.fieldCantBeEmpty;
    } else {
      return null;
    }
  }

  static String? validateConfirmPassword(String? v, String password) {
    if (v!.isEmpty || password.isEmpty) {
      return Strings.passwordCantBeEmpty;
    } else if (v.length < 8 || password.length < 8 || v != password) {
      return Strings.confirmPasswordValidation;
    } else {
      return null;
    }
  }*/

/*  static String? validateCheckbox({
    bool v = false,
    String error = Strings.checkboxValidation,
  }) {
    if (!v) {
      return error;
    } else {
      return null;
    }
  }*/
}
