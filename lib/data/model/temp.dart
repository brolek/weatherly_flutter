
class Temp {

  final num day;
  final num min;
  final num max;
  final num night;
  final num eve;
  final num morn;

	Temp.fromJsonMap(Map<String, dynamic> map): 
		day = map["day"],
		min = map["min"],
		max = map["max"],
		night = map["night"],
		eve = map["eve"],
		morn = map["morn"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['day'] = day;
		data['min'] = min;
		data['max'] = max;
		data['night'] = night;
		data['eve'] = eve;
		data['morn'] = morn;
		return data;
	}
}
