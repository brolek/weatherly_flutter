
class Feels_like {

  final num day;
  final num night;
  final num eve;
  final num morn;

	Feels_like.fromJsonMap(Map<String, dynamic> map): 
		day = map["day"],
		night = map["night"],
		eve = map["eve"],
		morn = map["morn"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['day'] = day;
		data['night'] = night;
		data['eve'] = eve;
		data['morn'] = morn;
		return data;
	}
}
