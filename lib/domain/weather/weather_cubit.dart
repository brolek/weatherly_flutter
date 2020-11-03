import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:weatherly_flutter/data/service/api_repository.dart';
import 'package:weatherly_flutter/data/service/network_exceptions.dart';
import 'package:weatherly_flutter/domain/weather/weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final ApiRepository _repository;

  WeatherCubit(this._repository) : super(WeatherState.loading());

  Future<void> requestData() async {
    emit(WeatherState.loading());
    if (await _requestLocationPermission()) {
      checkGps();
    }
  }

  Future openLocationSettings() async {
    await Geolocator.openLocationSettings();
  }

  Future<bool> _requestLocationPermission() async {
    var granted = await _requestPermission(Permission.location);
    if (granted != true) {
      emit(WeatherState.locationDenied());
    }
    return granted;
  }

  Future<bool> _requestPermission(Permission permission) async {
    return await permission.request().isGranted;
  }

  Future checkGps() async {
    if (!(await Geolocator.isLocationServiceEnabled())) {
      emit(WeatherState.enableGps());
      return;
    }
    _getUserLocation();
  }

  Future _getUserLocation() async {
    var location = await Geolocator.getCurrentPosition();
    debugPrint(location.toString());
    _repository.fetchAllWeather(location.latitude, location.longitude).then(
        (value) => value.when(
            success: (data) => emit(WeatherState.loaded(data)),
            failure: (error) => emit(WeatherState.error(error.message))));
  }
}
