import 'package:weatherly_flutter/data/model/temp.dart';
import 'package:weatherly_flutter/data/model/feels_like.dart';
import 'package:weatherly_flutter/data/model/weather.dart';

class Daily {

  final num dt;
  final num sunrise;
  final num sunset;
  final Temp temp;
  final Feels_like feels_like;
  final num pressure;
  final num humidity;
  final num dew_point;
  final num wind_speed;
  final num wind_deg;
  final List<Weather> weather;
  final num clouds;
  final num pop;
  final num uvi;

	Daily.fromJsonMap(Map<String, dynamic> map): 
		dt = map["dt"],
		sunrise = map["sunrise"],
		sunset = map["sunset"],
		temp = Temp.fromJsonMap(map["temp"]),
		feels_like = Feels_like.fromJsonMap(map["feels_like"]),
		pressure = map["pressure"],
		humidity = map["humidity"],
		dew_point = map["dew_point"],
		wind_speed = map["wind_speed"],
		wind_deg = map["wind_deg"],
		weather = List<Weather>.from(map["weather"].map((it) => Weather.fromJsonMap(it))),
		clouds = map["clouds"],
		pop = map["pop"],
		uvi = map["uvi"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['dt'] = dt;
		data['sunrise'] = sunrise;
		data['sunset'] = sunset;
		data['temp'] = temp == null ? null : temp.toJson();
		data['feels_like'] = feels_like == null ? null : feels_like.toJson();
		data['pressure'] = pressure;
		data['humidity'] = humidity;
		data['dew_point'] = dew_point;
		data['wind_speed'] = wind_speed;
		data['wind_deg'] = wind_deg;
		data['weather'] = weather != null ? 
			this.weather.map((v) => v.toJson()).toList()
			: null;
		data['clouds'] = clouds;
		data['pop'] = pop;
		data['uvi'] = uvi;
		return data;
	}
}
