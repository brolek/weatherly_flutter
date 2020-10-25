import 'package:weatherly_flutter/data/model/current.dart';
import 'package:weatherly_flutter/data/model/minutely.dart';
import 'package:weatherly_flutter/data/model/hourly.dart';
import 'package:weatherly_flutter/data/model/daily.dart';

class AllWeather {

  final double lat;
  final double lon;
  final String timezone;
  final int timezone_offset;
  final Current current;
  final List<Minutely> minutely;
  final List<Hourly> hourly;
  final List<Daily> daily;

	AllWeather.fromJsonMap(Map<String, dynamic> map): 
		lat = map["lat"],
		lon = map["lon"],
		timezone = map["timezone"],
		timezone_offset = map["timezone_offset"],
		current = Current.fromJsonMap(map["current"]),
		minutely = List<Minutely>.from(map["minutely"].map((it) => Minutely.fromJsonMap(it))),
		hourly = List<Hourly>.from(map["hourly"].map((it) => Hourly.fromJsonMap(it))),
		daily = List<Daily>.from(map["daily"].map((it) => Daily.fromJsonMap(it)));

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['lat'] = lat;
		data['lon'] = lon;
		data['timezone'] = timezone;
		data['timezone_offset'] = timezone_offset;
		data['current'] = current == null ? null : current.toJson();
		data['minutely'] = minutely != null ? 
			this.minutely.map((v) => v.toJson()).toList()
			: null;
		data['hourly'] = hourly != null ? 
			this.hourly.map((v) => v.toJson()).toList()
			: null;
		data['daily'] = daily != null ? 
			this.daily.map((v) => v.toJson()).toList()
			: null;
		return data;
	}
}
