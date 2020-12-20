import 'package:flutter/material.dart';
import 'package:world_time/pages/ChooseLocation.dart';
import 'package:world_time/pages/Home.dart';
import 'package:world_time/pages/Loading.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: "/Loading",// Starting route
    routes: {
      "/Home" : (context) => Home(),
      "/Loading" : (context) => Loading(),
      "/ChooseLocation" : (context) => ChooseLocation()
    },
  ));
}