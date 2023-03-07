import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  late String location; // location name for the UI
  late String time; // the time in that location
  late String url; // url to an asset flag icon
  late String flag; // location url for api endpoint
  late bool isDaytime; // true or false if daytime or not

  WorldTime({required this.location,required this.flag, required this.url});

  Future<void> getTime() async {
    Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
    Map data = jsonDecode(response.body);
    // print(data);

    // get properties from data
    String datetime = data['utc_datetime'];
    String offset1 = data['utc_offset'].substring(0,3);
    String offset2 = data['utc_offset'].substring(4,6);
    // print(datetime);
    // print(offset1);
    // print(offset2);

    // create datetime object
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours:int.parse(offset1),minutes:int.parse(offset2)));
    // now = now.add(Duration(hours: int.parse(offset1)));

    isDaytime = now.hour > 6 && now.hour < 17 ? true : false ;
    time = DateFormat.jm().format(now); // set the time property

  }

}

