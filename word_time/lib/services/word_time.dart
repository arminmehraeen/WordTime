import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WordTime {
  String location;
  String time;
  String flag;
  String url;
  bool isDayTime;

  WordTime({this.location, this.flag, this.url});

  Future<void> getData() async {
    var URL = 'http://worldtimeapi.org/api/timezone/${url}';

    try {
      Response response = await get(URL);
      Map data = jsonDecode(response.body);

      String dateTime = data['datetime'];
      String offsetHour = data['utc_offset'].substring(1, 3);
      String offsetMinutes = data['utc_offset'].substring(4, 6);

      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offsetHour)));
      now = now.add(Duration(minutes: int.parse(offsetMinutes)));

      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      time = 'Could not get time date';
    }
  }
}
