import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:weatherly_flutter/generated/l10n.dart';
import 'package:weatherly_flutter/utils/app_colors.dart';
import 'dart:async';

import 'main_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with AfterLayoutMixin {
  @override
  void afterFirstLayout(BuildContext context) {
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      backgroundColor: kColorLightGrey,
      body: _buildNameWidget(context),
    );
  }

  Widget _buildNameWidget(BuildContext context) {
    return Align(
        alignment:
            Alignment.lerp(Alignment.topCenter, Alignment.bottomCenter, 0.4),
        child: Text(
          S.of(context).app_name,
          style: TextStyle(color: kColorBlack, fontSize: 50.0),
        ));
  }

  void _startTimer() {
    var duration = const Duration(milliseconds: 1500);
    Timer(duration, () => _moveToMainScreen());
  }

  void _moveToMainScreen() {
    Navigator.of(context).pushReplacement(
        platformPageRoute(context: context, builder: (_) => MainScreen()));
  }
}
