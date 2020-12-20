import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
class WorldTime {
  String location = "New York";
  String country = "us";
  String apiKey = "3762ea2587d54b34941a6aa521348295";
  String time;
  bool isDayTime;

  WorldTime([this.location,this.country]);

  // Future is like a placeholder
  Future<void> getTime() async {
    try {
      // Make request to api to get data
      Response response = await get('https://timezone.abstractapi.com/v1/current_time?api_key=3762ea2587d54b34941a6aa521348295&location=$location');
      //response.body is now in json-string format and we can not access attributes. So we should convert json to Map format.
      Map responseData = jsonDecode(response.body);

      print("ResponseData: "+responseData.toString());
      // Take datetime from response and convert it to DateTime object
      DateTime dt = DateTime.parse(responseData["datetime"]);

      // if the time is between 6 and 20, it is day time
      isDayTime =  dt.hour>6 &&dt.hour<20;
      time = DateFormat.jm().format(dt);

    } catch (Exception) {
      print(Exception);
      time = "Could not get the time";
    }
  }
}
