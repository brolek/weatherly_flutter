import 'package:flutter/widgets.dart';
import 'package:weatherly_flutter/data/model/all_weather.dart';
import 'package:weatherly_flutter/generated/l10n.dart';
import 'package:weatherly_flutter/utils/app_colors.dart';
import 'package:weatherly_flutter/utils/extensions/extended_card.dart';
import 'package:weatherly_flutter/utils/helpers/date_helper.dart';

import 'expanded_column.dart';

class CardSunInfo extends StatefulWidget {
  final AllWeather data;

  const CardSunInfo({Key key, this.data}) : super(key: key);

  @override
  _CardSunInfoState createState() => _CardSunInfoState();
}

class _CardSunInfoState extends State<CardSunInfo> {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.max, children: [
      ExpandedColumn(
        headerText: S.of(context).sunrise,
        descText: widget.data.current.sunrise.toInt().toHour(),
        textColor: kColorBlack,
      ),
      ExpandedColumn(
        headerText: S.of(context).sunset,
        descText: widget.data.current.sunset.toInt().toHour(),
        textColor: kColorBlack,
      ),
    ]).wrapWithCard(kColorLightGrey);
  }
}
