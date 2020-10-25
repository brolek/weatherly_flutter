import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherly_flutter/data/service/api_repository.dart';
import 'package:weatherly_flutter/domain/weather/weather_cubit.dart';
import 'package:weatherly_flutter/weatherly_app.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider<WeatherCubit>(
        create: (BuildContext context) => WeatherCubit(ApiRepository()))
  ], child: WeatherlyApp()));
}
