import 'package:flutter/material.dart';

void main ()
{
  runApp (const App());

}

class App extends StatelessWidget {
  const App({super.key}) ;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GoMOOn',
     theme: ThemeData(scaffoldBackgroundColor:Color.fromRGBO(31, 31, 31, 1.0),),
      home:  Scaffold(
        //backgroundColor: Color.fromRGBO(31, 31, 31, 1.0),
      ),
    );
  }
}
