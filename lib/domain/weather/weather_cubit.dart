import 'package:bloc/bloc.dart';
import 'package:weatherly_flutter/data/service/api_repository.dart';
import 'package:weatherly_flutter/domain/weather/weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final ApiRepository _repository;

  WeatherCubit(this._repository) : super(WeatherState.loading());

  Future<void> requestData() async {
    emit(WeatherState.loading());
    Future.delayed(Duration(milliseconds: 1000),
        () => emit(WeatherState.error("Some error")));
  }
}
