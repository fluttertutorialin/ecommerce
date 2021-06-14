import '../../resource/style/app_text_style.dart';
import '../../util/extensions.dart';
import 'package:flutter/material.dart';

class EmptyWidget<T> extends StatelessWidget {
  final List<T> listData;
  final Widget widget;
  final bool isLoading;
  final String error;

  EmptyWidget(
      {required this.listData,
      required this.widget,
      required this.isLoading,
      required this.error});

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? circularProgressIndicator()
        : error != ''
            ? Padding(
                padding: EdgeInsets.all(10),
                child:
                    Center(child: Text(error, style: AppTextStyle.errorStyle)))
            : listData.isEmpty
                ? Text('Empty')
                : widget;
  }
}
