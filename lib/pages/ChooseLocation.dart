import 'package:flutter/material.dart';
import 'package:world_time/services/WorldTime.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  bool isClicked = false;
  List<WorldTime> locations = [
    WorldTime("Istanbul", "tr"),
    WorldTime("Lisbon", "pt"),
    WorldTime("Tokyo", "jp"),
    WorldTime("Baku ", "az"),
    WorldTime("London", "en"),
    WorldTime("Seoul", "kr"),
    WorldTime("Milan ", "it"),
    WorldTime("Berlin", "de"),
    WorldTime("Bern", "ch"),
    WorldTime("New York", "us"),
    WorldTime("Nairobi", "ke"),
    WorldTime("Ankara", "tr"),
    WorldTime("Paris", "fr"),
    WorldTime("Chicago", "us"),
    WorldTime("Jakarta", "id"),
    WorldTime("New Delhi", "in"),
    WorldTime("Nur-Sultan", "kz"),
    WorldTime("Doha", "qa"),
    WorldTime("Izmir", "tr"),
    WorldTime("Lyon", "fr"),
    WorldTime("Rome ", "it"),
    WorldTime("Minsk ", "be"),
  ];

  void updateTime(index) async {
    WorldTime worldTime = locations[index];
    // get the time
    await worldTime.getTime();

    // send data to previous route
    Navigator.pop(context, {
      "location": worldTime.location,
      "country": worldTime.country,
      "time": worldTime.time,
      "isDayTime": worldTime.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[700],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        leading: BackButton(
          color: Colors.blueGrey[100],
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Choose Location Screen",
          style: TextStyle(
            color: Colors.blueGrey[100],
          ),
        ),
        titleSpacing: 2,
        centerTitle: true,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(
          locations.length,
          (index) {
            return Card(
              color: Colors.black38,
              child: InkWell(
                onTap: () {
                  if (!isClicked) { // check to not get time two time
                    updateTime(index);
                    isClicked = true;
                  }
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(alignment: Alignment.center),
                    CircleAvatar(
                      backgroundImage: AssetImage("lib/assets/${locations[index].country + ".png"}"),
                      radius: 50,
                    ),
                    Text(
                      locations[index].location,
                      style: TextStyle(color: Colors.blueGrey[100], fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
