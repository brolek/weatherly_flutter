import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weatherly_flutter/data/model/all_weather.dart';

part 'weather_state.freezed.dart';

@freezed
abstract class WeatherState with _$WeatherState {
  const factory WeatherState.loading() = _WeatherLoading;
  const factory WeatherState.loaded(AllWeather weather) = _WeatherLoaded;
  const factory WeatherState.error(String message) = _WeatherError;
}
