import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:money_track/src/util/themes/base_theme.dart';

class InputWithLabel extends StatelessWidget {
  final ThemeBase theme = GetIt.I.get<ThemeBase>();

  final String? label;
  final String? hint;
  final bool obscureText;
  final TextInputType? inputType;

  final TextEditingController controller;

  InputWithLabel(
      {Key? key,
      this.label,
      this.hint,
      this.inputType,
      required this.controller,
      this.obscureText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (label != null && label!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              label!,
              style: theme.labelTextStyle,
            ),
          ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: theme.textInputDecorationStyle,
          height: 60.0,
          child: TextFormField(
            obscureText: obscureText,
            controller: controller,
            keyboardType: inputType,
            style: theme.inputTextStyle,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: theme.inputColor,
              ),
              hintText: hint,
              hintStyle: theme.hintTextStyle,
            ),
          ),
        ),
      ],
    );
  }
}
