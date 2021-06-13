/*
   DEVELOPED BY: KAMLESH LAKHANI
   FOR WITHOUT ACCESS CLASS NAME

   CREATE EXTENSION SYNTAX
   extension <extension name> on <type> {
     (<member definition>)*
   }

   - NUM EXTENSION: (BORDER RADIUS)
   - STRING EXTENSION: (HEX COLOR, IMAGE, DEBUG LOG, CONCATWITHSPACE ('left'.concatWithSpace('right')), )
   - DATETIME EXTENSION: ()
   - WIDGET EXTENSION: ()
   - INT EXTENSION: ()
   - BuildContext EXTENSION: ()
   - GlobalKeyExtension EXTENSION: (RENDER-OBJECT KEY)
*/

import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:intl/intl.dart';
import '../../import_package.dart';

// NUM (BORDER RADIUS) EXTENSION
extension NumExt on num {
  BorderRadius get borderRadius => BorderRadius.circular(this.r);

  InputBorder outlineInputBorder({
    BorderSide borderSide = BorderSide.none,
  }) =>
      OutlineInputBorder(
        borderRadius: this.borderRadius,
        borderSide: borderSide,
      );

  BorderSide borderSide({
    Color? color,
    double? width,
    BorderStyle? style,
  }) =>
      BorderSide(
          color: color ?? Colors.white,
          width: this.toDouble(),
          style: style ?? BorderStyle.solid);
}

// STRING (HEX COLOR, IMAGE, DEBUG LOG) EXTENSION
extension StringExt on String {
  //HEX COLOR
  Color get fromHex {
    final buffer = StringBuffer();
    if (this.length == 6 || this.length == 7) {
      buffer.write('ff');
    }

    if (this.startsWith('#')) {
      buffer.write(this.replaceFirst('#', ''));
    }
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  //IMAGE
  String get image => 'assets/images/$this.png';
  Image imageAsset({Size? size, BoxFit? fit, Color? color}) => Image.asset(this,
      color: color, width: size?.width, height: size?.height, fit: fit);

  debugLog() {
    return debugPrint(
        '\n******************************* DebugLog *******************************\n'
        ' $this'
        '\n******************************* DebugLog *******************************\n',
        wrapWidth: 1024);
  }

  concatWithSpace(String right) {
    return '$this $right';
  }

  /// crypto library
  getHMacMd5Str(String message) {
    //'secretKey'.getHMacMd5Str('message');
    List<int> secretBytes = utf8.encode(this);
    List<int> messageBytes = utf8.encode(message);

    //  var hmac = new Hmac(sha256.newInstance(), secretBytes); // sha256
    //  var hmac = new Hmac(sha1, secretBytes); // sha1
    var hmac = Hmac(md5, secretBytes); // md5
    var bytes = hmac.convert(messageBytes).toString();
    return bytes;
  }

  duSHA256() {
    String salt = 'EIpWsyfiy@R@X#qn17!StJNdZK1fFF8iV6ffN!goZkqt#JxO';
    var bytes = utf8.encode(this + salt);
    var digest = sha256.convert(bytes);

    return digest.toString();
  }
}

// DATETIME EXTENSION
extension DateTimeFormatterExt on DateTime {
  String formatDate({
    String dateFormat = 'yyyy-MM-dd',
  }) {
    final formatter = DateFormat(dateFormat);
    return formatter.format(this);
  }
}

// WIDGET EXTENSION
extension WidgetExt on Widget {
  circularProgressIndicator() => Container(
      alignment: FractionalOffset.center,
      child: CircularProgressIndicator(strokeWidth: 1));

  align({Alignment alignment = Alignment.center}) =>
      Align(alignment: alignment, child: this);
}

// INT EXTENSION
extension IntExt on int {
  String formatDuration() {
    final min = this ~/ 60;
    final sec = this % 60;
    return "${min.toString().padLeft(2, "0")}:${sec.toString().padLeft(2, "0")} min";
  }
}

// BuildContext EXTENSION
extension BuildContextExt on BuildContext {
  /// FOR PROVIDER USE
  //T provide<T>() => Provider.of<T>(this);
}

// GLOBAL KEY FOR RENDER OBJECT
extension GlobalKeyExtension on GlobalKey {
  Rect? get globalPaintBounds {
    final renderObject = currentContext?.findRenderObject();
    final translation = renderObject?.getTransformTo(null).getTranslation();
    if (translation != null && renderObject != null) {
      return renderObject.paintBounds
          .shift(Offset(translation.x, translation.y));
    } else {
      return null;
    }
  }
}


extension voidExt on void {
  back() {
    Get.back();
  }
}

extension DynamicExt on dynamic {
  offAllNamed() {
    Get.offAllNamed(this);
  }

  changeScreen() {
    Get.toNamed(this);
  }

  getArgument() {
    return Get.arguments;
  }
}

extension futureExt on Future {
  changeScreenGetArgument(String routeName, {dynamic arguments}) async {
    return Get.toNamed(routeName, arguments: arguments)!.then((value) => value);
  }
}
