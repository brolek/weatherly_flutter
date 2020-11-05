import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weatherly_flutter/data/model/all_weather.dart';
import 'package:weatherly_flutter/generated/l10n.dart';
import 'package:weatherly_flutter/utils/app_colors.dart';
import 'package:weatherly_flutter/utils/extensions/extended_card.dart';

class CardMain extends StatefulWidget {
  final AllWeather data;

  const CardMain({Key key, this.data}) : super(key: key);

  @override
  _CardMainState createState() => _CardMainState();
}

class _CardMainState extends State<CardMain> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(getImageUrl(widget.data.current.weather[0].icon),
                height: 70),
            Flexible(child: Container()),
            Text("${widget.data.current.temp.toInt()}°",
                style: TextStyle(
                    fontSize: 60,
                    color: kColorWhite,
                    fontWeight: FontWeight.bold)),
          ]),
      Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(S.of(context).clouds(widget.data.current.clouds.toInt()),
              style: TextStyle(color: kColorWhite)),
          Flexible(child: Container()),
          Icon(Icons.arrow_upward_rounded, color: kColorWhite, size: 16),
          Text("${widget.data.daily[0].temp.max.toInt()}°",
              style: TextStyle(color: kColorWhite)),
          SizedBox(width: 6),
          Icon(Icons.arrow_downward_rounded, color: kColorWhite, size: 16),
          Text("${widget.data.daily[0].temp.min.toInt()}°",
              textAlign: TextAlign.start, style: TextStyle(color: kColorWhite)),
        ],
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Text(widget.data.current.weather[0].description,
            textAlign: TextAlign.start,
            style: TextStyle(
                color: kColorWhite, fontWeight: FontWeight.bold, fontSize: 16)),
      ),
      Text(S.of(context).feels_like(widget.data.current.feels_like.toInt()),
          style: TextStyle(color: kColorWhite))
    ]).wrapWithCard(kColorPrimary);
  }

  getImageUrl(String img) => "https://openweathermap.org/img/wn/$img@2x.png";
}
