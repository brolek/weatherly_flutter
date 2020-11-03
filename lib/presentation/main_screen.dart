import 'package:after_layout/after_layout.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:weatherly_flutter/data/model/all_weather.dart';
import 'package:weatherly_flutter/domain/weather/weather_cubit.dart';
import 'package:weatherly_flutter/domain/weather/weather_state.dart';
import 'package:weatherly_flutter/generated/l10n.dart';
import 'package:weatherly_flutter/presentation/widgets/main/main_container.dart';
import 'package:weatherly_flutter/utils/app_colors.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with AfterLayoutMixin, WidgetsBindingObserver {
  AppLifecycleState previousState = AppLifecycleState.resumed;

  @override
  void afterFirstLayout(BuildContext context) {
    WidgetsBinding.instance.addObserver(this);
    context.bloc<WeatherCubit>().requestData();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    debugPrint(state.toString());
    if (state == AppLifecycleState.resumed &&
        previousState == AppLifecycleState.paused) {
      context.bloc<WeatherCubit>().requestData();
    }
    previousState = state;
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      backgroundColor: kColorLightGrey,
      body: BlocConsumer<WeatherCubit, WeatherState>(
        listener: (BuildContext context, state) async {
          if (state == WeatherState.enableGps()) {
            await _buildEnableGpsDialog();
          }
        },
        buildWhen: (previous, current) => current != WeatherState.enableGps(),
        builder: (BuildContext context, state) {
          return state.when(
              loading: _buildLoader,
              loaded: (AllWeather data) => _buildMainPage(data),
              error: (String error) => _buildError(error),
              locationDenied: () =>
                  _buildLocationDeniedInfo(S.of(context).enable_permission),
              enableGps: () => Container());
        },
      ),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  Widget _buildLoader() {
    return Container(
      child: Center(child: PlatformCircularProgressIndicator()),
    );
  }

  Widget _buildMainPage(AllWeather data) {
    return MainContainer(data: data);
  }

  Widget _buildLocationDeniedInfo(String message) {
    return _buildMessagePage(
        S.of(context).location_info_title, message, S.of(context).enable);
  }

  Widget _buildError(String error) {
    return _buildMessagePage(
        S.of(context).error, error, S.of(context).try_again);
  }

  Widget _buildMessagePage(String title, String message, String buttonText) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title,
                textAlign: TextAlign.center,
                style: TextStyle(color: kColorBlack, fontSize: 22)),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
              child: Text(message, textAlign: TextAlign.center),
            ),
            PlatformButton(
                color: kColorPrimary,
                child: Text(
                  buttonText,
                  style: TextStyle(color: kColorLightGrey),
                ),
                onPressed: () {
                  context.bloc<WeatherCubit>().requestData();
                })
          ],
        ),
      ),
    );
  }

  Future _buildEnableGpsDialog() async {
    await showPlatformDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return PlatformAlertDialog(
            title: Text(S.of(context).enable_location),
            content: Text(S.of(context).enable_location_desc),
            actions: <Widget>[
              PlatformButton(
                  child: Text(S.of(context).settings),
                  onPressed: () async {
                    Navigator.pop(context);
                    await context.bloc<WeatherCubit>().openLocationSettings();
                  })
            ],
          );
        });
  }
}
