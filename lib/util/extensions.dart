/*
   DEVELOPED BY: KAMLESH LAKHANI
   FOR WITHOUT ACCESS CLASS NAME
   - NUM EXTENSION: (BORDER RADIUS)
   - STRING EXTENSION: (HEX COLOR, IMAGE, DEBUG LOG)
   - DATETIME EXTENSION: ()
   - WIDGET EXTENSION: ()
   - INT EXTENSION: ()
   - BuildContext EXTENSION: ()
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
        style: style ?? BorderStyle.solid,
      );
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
  Image imageAsset({
    Size? size,
    BoxFit? fit,
    Color? color,
  }) =>
      Image.asset(
        this,
        color: color,
        width: size?.width,
        height: size?.height,
        fit: fit,
      );

  debugLog() {
    return debugPrint(
      '\n******************************* DebugLog *******************************\n'
      ' $this'
      '\n******************************* DebugLog *******************************\n',
      wrapWidth: 1024,
    );
  }

  /// crypto library
  getHMacMd5Str(String secret, String message) {
    List<int> secretBytes = utf8.encode(secret);
    List<int> messageBytes = utf8.encode(message);

    //  var hmac = new Hmac(sha256.newInstance(), secretBytes); // sha256
    //  var hmac = new Hmac(sha1, secretBytes); // sha1
    var hmac = new Hmac(md5, secretBytes); // md5
    var bytes = hmac.convert(messageBytes).toString();
    return bytes;
  }

  duSHA256(String input) {
    String salt = 'EIpWsyfiy@R@X#qn17!StJNdZK1fFF8iV6ffN!goZkqt#JxO';
    var bytes = utf8.encode(input + salt);
    var digest = sha256.convert(bytes);

    return digest.toString();
  }
}

// DATETIME EXTENSION
extension DateTimeFormatterExt on DateTime {
  String formatedDate({
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
extension BuildContextExt on BuildContext {}
