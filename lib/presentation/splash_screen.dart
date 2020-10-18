import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:weatherly_flutter/generated/l10n.dart';
import 'package:weatherly_flutter/utils/app_colors.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      backgroundColor: kColorLightGrey,
      body: _generateNameWidget(context),
    );
  }

  Widget _generateNameWidget(BuildContext context) {
    return Align(
        alignment:
            Alignment.lerp(Alignment.topCenter, Alignment.bottomCenter, 0.4),
        child: Text(
          S.of(context).app_name,
          style: TextStyle(color: kColorBlack, fontSize: 50.0),
        ));
  }
}
