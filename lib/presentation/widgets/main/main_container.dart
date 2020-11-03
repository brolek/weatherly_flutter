import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weatherly_flutter/data/model/all_weather.dart';
import 'package:weatherly_flutter/generated/l10n.dart';
import 'package:weatherly_flutter/utils/app_colors.dart';

class MainContainer extends StatefulWidget {
  final AllWeather data;

  const MainContainer({Key key, this.data}) : super(key: key);

  @override
  _MainContainerState createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(S.of(context).hello,
              style: TextStyle(color: kColorBlack, fontSize: 32)),
          Transform.rotate(
              angle: 0.7, child: Icon(Icons.navigation, color: kColorGrey))
        ],
      ),
    );
  }
}
