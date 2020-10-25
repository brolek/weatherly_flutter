import 'package:after_layout/after_layout.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:weatherly_flutter/data/model/all_weather.dart';
import 'package:weatherly_flutter/domain/weather/weather_cubit.dart';
import 'package:weatherly_flutter/domain/weather/weather_state.dart';
import 'package:weatherly_flutter/utils/app_colors.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with AfterLayoutMixin {
  @override
  void afterFirstLayout(BuildContext context) {
    context.bloc<WeatherCubit>().requestData();
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      backgroundColor: kColorLightGrey,
      body: BlocConsumer<WeatherCubit, WeatherState>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {
          return state.when(
              loading: () => _buildLoader(),
              loaded: (AllWeather data) => Container(),
              error: (String error) => _buildError(error));
        },
      ),
    );
  }

  Widget _buildLoader() {
    return Container(
      child: Center(child: PlatformCircularProgressIndicator()),
    );
  }

  Widget _buildError(String error) {
    return Container(
      child: Center(
        child: Text(error),
      ),
    );
  }
}
