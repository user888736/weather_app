import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentIndex = 0;

  var temp;
  var description;
  var cityName;
  var conditions;
  var icon;
  var lat;
  var long;

  Future getWeather() async {
    http.Response response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=Krakow&appid=e3e54c2aa0433e86695a41a0c2afcaf7&units=metric"));
    var results = jsonDecode(response.body);

    setState(() {
      this.cityName = results["name"];
      this.temp = results["main"]["temp"];
      this.description = results["weather"][0]["description"];
      this.conditions = results["weather"][0]["main"];
      this.icon = results["weather"][0]["icon"];
      this.lat = results["coord"]["lat"];
      this.long = results["coord"]["lon"];
    });
  }

  @override
  void initState() {
    super.initState();
    this.getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text('Weather for ' + cityName.toString()),
          backgroundColor: Colors.transparent,
          bottomOpacity: 0.0,
          elevation: 0.0,
          centerTitle: true,
        ),
        body: Center(
            child: currentIndex == 0
                ? Stack(
                    children: [
                      Image.asset(
                        './assets/dark.png',
                        fit: BoxFit.cover,
                        height: double.infinity,
                        width: double.infinity,
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 120,
                            ),
                            Text(
                              temp.toString() + "\u00B0C",
                              style: TextStyle(
                                fontSize: 60,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              long.toString() + ", " + lat.toString(),
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              conditions.toString(),
                              style: TextStyle(
                                fontSize: 40,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                : currentIndex == 1
                    ? Stack(
                        children: [
                          Image.asset(
                            './assets/dark.png',
                            fit: BoxFit.cover,
                            height: double.infinity,
                            width: double.infinity,
                          ),
                          Text(
                            "data",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    : Stack(
                        children: [
                          Image.asset(
                            './assets/dark.png',
                            fit: BoxFit.cover,
                            height: double.infinity,
                            width: double.infinity,
                          ),
                          Text(
                            "data2",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )),
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.grey[400],
          selectedItemColor: Colors.white,
          items: const [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: "Details",
              icon: Icon(Icons.cloud),
            ),
            BottomNavigationBarItem(
              label: "Daily",
              icon: Icon(Icons.today),
            ),
          ],
          currentIndex: currentIndex,
          onTap: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
      ),
    );
  }
}
