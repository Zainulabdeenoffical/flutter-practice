import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        // backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Text("My Testing App"),
          foregroundColor: Colors.white,
          backgroundColor: Colors.blueGrey[900],
          centerTitle: true,
        ),
        body: Center(
            child: Image(image: AssetImage('images/tree.png')
              // NetworkImage("https://res.cloudinary.com/www-travelpakistani-com/image/upload/v1661243930/Faisal_Mosque_travelpakistani.jpg")
            )),
      ),
    );
  }
}