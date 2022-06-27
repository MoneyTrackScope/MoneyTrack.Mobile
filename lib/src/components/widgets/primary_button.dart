import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:money_track/src/util/themes/base_theme.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final double? height;
  final double? width;
  late double minHeight;
  late double minWidth;
  final Alignment alignment;
  final String text;

  final ThemeBase theme = GetIt.I.get<ThemeBase>();

  PrimaryButton(
      {Key? key,
      required this.onPressed,
      this.alignment = Alignment.center,
      this.height,
      this.width,
      required this.text})
      : super(key: key) {
    minHeight = height == null || height! < 15 ? 15 : height!;
    minWidth =
        width == null || width! < text.length * 15 ? text.length * 15 : width!;
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            minimumSize: Size(minWidth, minHeight),
            padding: EdgeInsets.zero,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(25.0),
              ),
            )),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              gradient: theme.primaryButtonGradient,
              borderRadius: const BorderRadius.all(
                Radius.circular(25.0),
              ),
              boxShadow: theme.primaryButtonShadowList),
          alignment: Alignment.center,
          child: Text(text,
              textAlign: TextAlign.left, style: theme.primaryButtonTextStyle),
        ),
      ),
    );
  }
}
