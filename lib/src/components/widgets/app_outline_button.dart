import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:money_track/src/util/themes/base_theme.dart';

class AppOutlineButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final double? height;
  final double? width;
  late double minHeight;
  late double minWidth;
  final Alignment alignment;
  final String text;

  final ThemeBase theme = GetIt.I.get<ThemeBase>();

  AppOutlineButton(
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
      child: OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            minimumSize: Size(minWidth, minHeight),
            padding: EdgeInsets.zero,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(25.0),
              ),
            ),
            side: BorderSide(width: 1, color: theme.secondaryColor),
          ),
          child: Container(
            width: width,
            height: height,
            alignment: Alignment.center,
            child: ShaderMask(
              shaderCallback: (rect) =>
                  theme.appOutlineButtonGradient.createShader(rect),
              child: Text(text,
                  textAlign: TextAlign.left,
                  style: theme.appOutlineButtonContentStyle),
            ),
          )),
    );
  }
}
