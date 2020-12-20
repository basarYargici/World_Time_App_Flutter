import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time/services/WorldTime.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  //Learning async and wait
  // void getData() async {
  //   await Future.delayed(Duration(seconds: 3), () {
  //     print("3 seconds delayed");
  //   });
  //
  //   print("Out of wait");
  // }

  void getData() async {
    WorldTime _worldTime = WorldTime("Istanbul", "tr");

    await _worldTime.getTime();
    // push to Home route and send the data
    Navigator.pushReplacementNamed(context, "/Home", arguments: {
      "location": _worldTime.location,
      "country": _worldTime.country,
      "time": _worldTime.time,
      "isDayTime": _worldTime.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
    // get data while the route initialising
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[800],
        body: SpinKitDoubleBounce(
          color: Colors.white,
          size: 50.0,
        ));
  }
}
