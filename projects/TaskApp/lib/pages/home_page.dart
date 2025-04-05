import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late  double  _deviceHeight,_deviceWidth;
  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    
    return  Scaffold(
      appBar: AppBar(
        toolbarHeight: _deviceHeight  * 0.15,
        title: Text('Task App',style: TextStyle(fontSize: 25),),
      ),
    );
  }
}
