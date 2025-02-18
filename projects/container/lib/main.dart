import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Flutter Container"),
      ),
       
      body:
      // Center(
        //   child: Container(
        //     width: 200,
        //     height: 200,
        //     color: Colors.blue,
        //     child: Text("hello world"),
        //   ),
        // ),
        Text('Hello World',style: TextStyle(
          fontSize: 35,
          color :Colors.black,
            fontWeight  :FontWeight.bold,
          backgroundColor: Colors.lightBlue
        ),)

    );
  }
}




