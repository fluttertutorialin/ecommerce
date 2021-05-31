import 'package:flutter/material.dart';

class CustomRadioOption<T> extends StatefulWidget {
  final T init;
  final List<T> listOption;
  final List<T>? listDisable;
  final List<String> listNameOption;
  final Function(T result)? onChange;

  CustomRadioOption({
    Key? key,
    this.onChange,
    required this.init,
    required this.listOption,
    required this.listNameOption,
    this.listDisable,
  }) : super(key: key);
  @override
  createState() => _CustomRadioOptionState<T>();
}

class _CustomRadioOptionState<T> extends State<CustomRadioOption<T?>> {
  T? _choose;

  void _onChange(T? value) {
    widget.onChange!(value);
    setState(() {
      _choose = value;
    });
  }

  @override
  void initState() {
    _choose = widget.init;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: _buildListItem(),
    );
  }

  List<Widget> _buildListItem() {
    return List.generate(widget.listOption.length, (index) {
      return Expanded(
          child: RadioListTile<T?>(
              title: Text(widget.listNameOption[index],
                  style: const TextStyle(fontSize: 12)),
              value: widget.listOption[index],
              groupValue: _choose,
              onChanged:
                  widget.listDisable?.contains(widget.listOption[index]) ??
                          false
                      ? null
                      : _onChange));
    });
  }
}
