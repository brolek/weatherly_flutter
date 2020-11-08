import 'package:flutter/widgets.dart';
import 'package:weatherly_flutter/data/model/all_weather.dart';
import 'package:weatherly_flutter/data/model/current.dart';
import 'package:weatherly_flutter/generated/l10n.dart';
import 'package:weatherly_flutter/presentation/widgets/main/expanded_column.dart';
import 'package:weatherly_flutter/utils/app_colors.dart';
import 'package:weatherly_flutter/utils/extensions/extended_card.dart';

class CardSecondary extends StatefulWidget {
  final AllWeather data;

  const CardSecondary({Key key, this.data}) : super(key: key);

  @override
  _CardSecondaryState createState() => _CardSecondaryState();
}

class _CardSecondaryState extends State<CardSecondary> {
  Current _current;

  @override
  void initState() {
    _current = widget.data.current;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.max, children: [
      ExpandedColumn(
        headerText: S.of(context).wind,
        descText: S.of(context).wind_value(_current.wind_speed.toInt()),
        textColor: kColorWhite,
      ),
      ExpandedColumn(
        headerText: S.of(context).humidity,
        descText: S.of(context).humidity_value(_current.humidity.toInt()),
        textColor: kColorWhite,
      ),
      ExpandedColumn(
        headerText: S.of(context).pressure,
        descText: S.of(context).pressure_value(_current.pressure.toInt()),
        textColor: kColorWhite,
      )
    ]).wrapWithCard(kColorBlack);
  }
}
