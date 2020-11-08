import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherly_flutter/data/model/all_weather.dart';
import 'package:weatherly_flutter/domain/weather/weather_cubit.dart';
import 'package:weatherly_flutter/domain/weather/weather_state.dart';
import 'package:weatherly_flutter/generated/l10n.dart';
import 'package:weatherly_flutter/presentation/widgets/main/card_main.dart';
import 'package:weatherly_flutter/presentation/widgets/main/card_secondary.dart';
import 'package:weatherly_flutter/presentation/widgets/main/card_sun_info.dart';
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
        child: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (BuildContext context, state) {
            return Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(S.of(context).hello,
                    style: TextStyle(color: kColorBlack, fontSize: 32)),
                SizedBox(height: 8),
                _buildLocationRow(context),
                SizedBox(height: 14),
                CardMain(data: widget.data),
                SizedBox(height: 12),
                CardSecondary(data: widget.data),
                SizedBox(height: 12),
                CardSunInfo(data: widget.data)
              ],
            );
          },
        ));
  }

  Widget _buildLocationRow(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Transform.rotate(
            angle: 0.72, child: Icon(Icons.navigation, color: kColorGrey)),
        Padding(
          padding: EdgeInsets.only(left: 8, top: 4),
          child: Text(context.bloc<WeatherCubit>().cityName,
              style: TextStyle(color: kColorGrey, fontSize: 24)),
        )
      ],
    );
  }
}
