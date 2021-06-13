import 'dart:convert';
import 'package:http/http.dart';

class WorldTime {
  late String location; /** Location name for the UI */
  late String time; /** The time in that location */
  late String flag; /** URL to an asset glaf icon */
  late String url; /** Location url for api endPoint */

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {

    try{
      /** Make the request */
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      //print(data);

      /** Get properties from data */
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);
      /*print(datetime);
    print(offset);*/

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      /** Set the time property */
      time = now.toString();
    }
    catch(e){
      print('caught error: $e');
      time = 'Could not get time data';
    }
  }
}