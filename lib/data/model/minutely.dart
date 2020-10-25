
class Minutely {

  final int dt;
  final num precipitation;

	Minutely.fromJsonMap(Map<String, dynamic> map): 
		dt = map["dt"],
		precipitation = map["precipitation"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['dt'] = dt;
		data['precipitation'] = precipitation;
		return data;
	}
}
