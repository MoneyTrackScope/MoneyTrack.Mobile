import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:money_track/src/util/themes/base_theme.dart';

class CommonBody extends StatelessWidget {
  final Widget content;
  final EdgeInsetsGeometry? padding;

  final ThemeBase theme = GetIt.I.get<ThemeBase>();

  CommonBody({Key? key, required this.content, this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var currentPadding = padding ??
        const EdgeInsets.symmetric(
          horizontal: 40.0,
          vertical: 40.0,
        );

    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: theme.backgroundColorList,
                    stops: const [0.1, 0.8, 1],
                  ),
                ),
              ),
              SizedBox(
                  height: double.infinity,
                  child: Padding(
                    padding: currentPadding,
                    child: content,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
