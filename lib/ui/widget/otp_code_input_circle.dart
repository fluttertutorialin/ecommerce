import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/* CodeInput(
   length: 4,
   keyboardType: TextInputType.number,
   builder: CodeInputBuilders.lightCircle(),
   onFilled: (value) => print('Your input is $value.'),
   onDone: (value) => print('Your input is $value.'),
 )*/

typedef CodeInputBuilder = Widget Function(bool hasFocus, String char);

class OtpCodeInputCircle extends StatefulWidget {
  OtpCodeInputCircle._(
      {Key? key,
      required this.length,
      required this.focusNode,
      required this.keyboardType,
      required this.inputFormatters,
      required this.builder,
      this.spacing = 8,
      this.onChanged,
      this.onFilled,
      this.onDone})
      : super(key: key);

  factory OtpCodeInputCircle({
    Key? key,
    required int length,
    FocusNode? focusNode,
    TextInputType keyboardType = TextInputType.text,
    List<TextInputFormatter>? inputFormatters,
    required CodeInputBuilder builder,
    double spacing = 8,
    void Function(String value)? onChanged,
    void Function(String value)? onFilled,
    void Function(String value)? onDone,
  }) {
    assert(length > 0, 'The length needs to be larger than zero.');
    assert(length.isFinite, 'The length needs to be finite.');

    return OtpCodeInputCircle._(
        key: key,
        length: length,
        focusNode: focusNode ?? FocusNode(),
        keyboardType: keyboardType,
        inputFormatters:
            inputFormatters ?? _createInputFormatters(length, keyboardType),
        builder: builder,
        spacing: spacing,
        onChanged: onChanged,
        onFilled: onFilled,
        onDone: onDone);
  }

  final int length;

  final FocusNode focusNode;

  final TextInputType keyboardType;

  final List<TextInputFormatter> inputFormatters;

  final CodeInputBuilder builder;

  final double spacing;

  final void Function(String value)? onChanged;

  final void Function(String value)? onFilled;

  final void Function(String value)? onDone;

  static List<TextInputFormatter> _createInputFormatters(
      int length, TextInputType keyboardType) {
    final formatters = <TextInputFormatter>[
      LengthLimitingTextInputFormatter(length)
    ];

    if (keyboardType == TextInputType.number) {
      formatters.add(FilteringTextInputFormatter.allow(RegExp('^[0-9]*\$')));
    }

    return formatters;
  }

  @override
  _OtpCodeInputCircleState createState() => _OtpCodeInputCircleState();
}

class _OtpCodeInputCircleState extends State<OtpCodeInputCircle> {
  final controller = TextEditingController();

  String get text => controller.text;

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
          width: 0.0,
          height: 0.0,
          child: EditableText(
              controller: controller,
              focusNode: widget.focusNode,
              inputFormatters: widget.inputFormatters,
              keyboardType: widget.keyboardType,
              backgroundCursorColor: Colors.black,
              style: TextStyle(),
              // Doesn't really matter.
              cursorColor: Colors.black,
              // Doesn't really matter.
              onChanged: (value) => setState(() {
                    widget.onChanged?.call(value);
                    if (value.length == widget.length) {
                      widget.onFilled?.call(value);
                    }
                  }),
              onEditingComplete: () => setState(() {
                    widget.onDone?.call(controller.text);
                  }))),
      GestureDetector(
          onTap: () {
            final focusScope = FocusScope.of(context);
            focusScope.requestFocus(FocusNode());
            Future.delayed(
                Duration.zero, () => focusScope.requestFocus(widget.focusNode));
          },
          child: Container(
              color: Colors.transparent,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(widget.length, (i) {
                    final hasFocus = controller.selection.start == i;
                    final char = i < text.length ? text[i] : '';
                    var characterWidget = widget.builder(hasFocus, char);
                    if (i > 0) {
                      characterWidget = Padding(
                          padding: EdgeInsets.only(left: widget.spacing),
                          child: widget.builder(hasFocus, char));
                    }
                    return characterWidget;
                  }))))
    ]);
  }
}

abstract class CodeInputBuilders {
  static CodeInputBuilder containerized(
      {Duration animationDuration = const Duration(milliseconds: 50),
      required Size totalSize,
      required Size emptySize,
      required Size filledSize,
      required BoxDecoration emptyDecoration,
      required BoxDecoration filledDecoration,
      required TextStyle emptyTextStyle,
      required TextStyle filledTextStyle}) {
    return (bool hasFocus, String char) => Container(
        width: totalSize.width,
        height: totalSize.height,
        alignment: Alignment.center,
        child: AnimatedContainer(
            duration: Duration(milliseconds: 100),
            decoration: char.isEmpty ? emptyDecoration : filledDecoration,
            width: char.isEmpty ? emptySize.width : filledSize.width,
            height: char.isEmpty ? emptySize.height : filledSize.height,
            alignment: Alignment.center,
            child: Text(char,
                style: char.isEmpty ? emptyTextStyle : filledTextStyle)));
  }

  /// Builds the input inside a circle.
  static CodeInputBuilder circle(
      {double totalRadius = 30.0,
      double emptyRadius = 10.0,
      double filledRadius = 25.0,
      required Border border,
      required Color color,
      required TextStyle textStyle}) {
    final decoration =
        BoxDecoration(shape: BoxShape.circle, border: border, color: color);

    return containerized(
        totalSize: Size.fromRadius(totalRadius),
        emptySize: Size.fromRadius(emptyRadius),
        filledSize: Size.fromRadius(filledRadius),
        emptyDecoration: decoration,
        filledDecoration: decoration,
        emptyTextStyle: textStyle.copyWith(fontSize: 0.0),
        filledTextStyle: textStyle);
  }

  /// Builds the input inside a rectangle.
  static CodeInputBuilder rectangle({
    Size totalSize = const Size(50.0, 60.0),
    Size emptySize = const Size(20.0, 20.0),
    Size filledSize = const Size(40.0, 60.0),
    BorderRadius borderRadius = BorderRadius.zero,
    required Border border,
    required Color color,
    required TextStyle textStyle,
  }) {
    final decoration =
        BoxDecoration(border: border, borderRadius: borderRadius, color: color);

    return containerized(
        totalSize: totalSize,
        emptySize: emptySize,
        filledSize: filledSize,
        emptyDecoration: decoration,
        filledDecoration: decoration,
        emptyTextStyle: textStyle.copyWith(fontSize: 0.0),
        filledTextStyle: textStyle);
  }

  /// Builds the input inside a light circle.
  static CodeInputBuilder lightCircle(
      {double totalRadius = 30.0,
      double emptyRadius = 10.0,
      double filledRadius = 25.0}) {
    return circle(
        totalRadius: totalRadius,
        emptyRadius: emptyRadius,
        filledRadius: filledRadius,
        border: Border.all(color: Colors.white, width: 2.0),
        color: Colors.white10,
        textStyle: TextStyle(
            color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold));
  }

  /// Builds the input inside a light circle.
  static CodeInputBuilder darkCircle(
      {double totalRadius = 30.0,
      double emptyRadius = 10.0,
      double filledRadius = 25.0}) {
    return circle(
        totalRadius: totalRadius,
        emptyRadius: emptyRadius,
        filledRadius: filledRadius,
        border: Border.all(color: Colors.black, width: 2.0),
        color: Colors.black12,
        textStyle: TextStyle(
            color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold));
  }

  /// Builds the input inside a light rectangle.
  static CodeInputBuilder lightRectangle(
      {Size totalSize = const Size(50.0, 60.0),
      Size emptySize = const Size(20.0, 20.0),
      Size filledSize = const Size(40.0, 60.0),
      BorderRadius borderRadius = BorderRadius.zero}) {
    return rectangle(
        totalSize: totalSize,
        emptySize: emptySize,
        filledSize: filledSize,
        borderRadius: borderRadius,
        border: Border.all(color: Colors.white, width: 2.0),
        color: Colors.white10,
        textStyle: TextStyle(
            color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold));
  }

  /// Builds the input inside a dark rectangle.
  static CodeInputBuilder darkRectangle({
    Size totalSize = const Size(50.0, 60.0),
    Size emptySize = const Size(20.0, 20.0),
    Size filledSize = const Size(40.0, 60.0),
    BorderRadius borderRadius = BorderRadius.zero,
  }) {
    return rectangle(
        totalSize: totalSize,
        emptySize: emptySize,
        filledSize: filledSize,
        borderRadius: borderRadius,
        border: Border.all(color: Colors.black, width: 2.0),
        color: Colors.black12,
        textStyle: TextStyle(
            color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold));
  }
}
