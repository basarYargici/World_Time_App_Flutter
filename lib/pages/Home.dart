import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    // get data from other route
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;

    //print(data);

    // setting background image
    String bg = data["isDayTime"] ? "dt.jpg" : "nt.jpg";
    // setting the notification bar's color
    Color bgColor = data["isDayTime"] ? Colors.blue[400] : Colors.black12;
    // setting the text's color
    Color chColor = data["isDayTime"] ? Colors.white : Colors.blueGrey[300];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('lib/assets/$bg'),
            fit: BoxFit.cover,
          )),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 150, 0, 50),
            child: Center(
              child: Column(
                children: [
                  FlatButton.icon(
                    // push to ChooseLocation route, it will return data and get it with async-await
                    onPressed: () async {
                      dynamic result = await Navigator.pushNamed(context, "/ChooseLocation");
                      if (result != null) {
                        setState(() {
                          data = {
                            "time": result["time"],
                            "country": result["country"],
                            "location": result["location"],
                            "isDayTime": result["isDayTime"],
                          };
                        });
                      }
                    },
                    icon: Icon(
                      Icons.location_on_rounded,
                      size: 40,
                      color: Colors.white,
                    ),
                    label: Text(
                      "Change location",
                      style: TextStyle(
                        color: chColor,
                        fontSize: 30,
                        fontFamily: "Satisfy",
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    data["time"],
                    style: TextStyle(
                      color: chColor,
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Satisfy",
                      letterSpacing: 2,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    data["location"],
                    style: TextStyle(
                      color: chColor,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Satisfy",
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
