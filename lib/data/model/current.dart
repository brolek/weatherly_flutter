import 'package:weatherly_flutter/data/model/weather.dart';

class Current {

  final num dt;
  final num sunrise;
  final num sunset;
  final num temp;
  final num feels_like;
  final num pressure;
  final num humidity;
  final num dew_point;
  final num uvi;
  final num clouds;
  final num visibility;
  final num wind_speed;
  final num wind_deg;
  final List<Weather> weather;

	Current.fromJsonMap(Map<String, dynamic> map): 
		dt = map["dt"],
		sunrise = map["sunrise"],
		sunset = map["sunset"],
		temp = map["temp"],
		feels_like = map["feels_like"],
		pressure = map["pressure"],
		humidity = map["humidity"],
		dew_point = map["dew_point"],
		uvi = map["uvi"],
		clouds = map["clouds"],
		visibility = map["visibility"],
		wind_speed = map["wind_speed"],
		wind_deg = map["wind_deg"],
		weather = List<Weather>.from(map["weather"].map((it) => Weather.fromJsonMap(it)));

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['dt'] = dt;
		data['sunrise'] = sunrise;
		data['sunset'] = sunset;
		data['temp'] = temp;
		data['feels_like'] = feels_like;
		data['pressure'] = pressure;
		data['humidity'] = humidity;
		data['dew_point'] = dew_point;
		data['uvi'] = uvi;
		data['clouds'] = clouds;
		data['visibility'] = visibility;
		data['wind_speed'] = wind_speed;
		data['wind_deg'] = wind_deg;
		data['weather'] = weather != null ? 
			this.weather.map((v) => v.toJson()).toList()
			: null;
		return data;
	}
}
