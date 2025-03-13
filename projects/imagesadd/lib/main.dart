import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Lab2(),
    );
  }
}

class Lab2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
          child: Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('images/datacamp.jpg'),
                ),
                Text(
                  'Muhammad Zain Ul Abideen',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  'Senior  Developer',
                  style: TextStyle(color: Colors.teal[50], fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 30,
                  width: 370,
                  color: Colors.white,
                )
              ],
            ),
          )),
    );
  }
}
