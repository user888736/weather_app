import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String cityName = "Kraków";
  String temp = "3";
  String conditions = "Cloudy";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Weather'),
          backgroundColor: Colors.blueGrey[800],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Weather for: ' + cityName,
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                ),
              ),
              Text(
                'Temperature: ' + temp + "\u00B0C",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
              Text(
                'Conditions: ' + conditions,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.grey[400],
          selectedItemColor: Colors.white,
          items: const [
            BottomNavigationBarItem(
              label: "Now",
              icon: Icon(Icons.star_outline),
            ),
            BottomNavigationBarItem(
              label: "Hourly",
              icon: Icon(Icons.schedule),
            ),
            BottomNavigationBarItem(
              label: "Daily",
              icon: Icon(Icons.today),
            ),
          ],
          backgroundColor: Colors.blueGrey[800],
        ),
        backgroundColor: Colors.blueGrey[700],
      ),
    );
  }
}
