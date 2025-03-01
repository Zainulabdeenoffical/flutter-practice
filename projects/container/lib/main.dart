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
        // Text('Hello World',style: TextStyle(
        //   fontSize: 35,
        //   color :Colors.black,
        //     fontWeight  :FontWeight.bold,
        //   backgroundColor: Colors.lightBlue
        // ),)
      // TextButton(
      //   child: Text("clikc here"),
      //   onPressed: ()
      //   {
      //     print("hello clikced");
      //   },
      //   onLongPress: ()
      //   {
      //     print("long pressed");
      //   },
      //
      // )
      // ElevatedButton(
      //   child: Text("Log in"),
      //   onPressed: ()
      //   {
      //     print("button Clicked");
      //   },
      // )

      // OutlinedButton(
      //   child: Text("outlined button"),
      //   onPressed: ()
      //   {
      //     print(" button clicked");
      //   },
      // )

      // Row(
      //   // mainAxisAlignment: MainAxisAlignment.spaceAround,
      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //   // crossAxisAlignment: crossAxisAlignment.center,
      //   children: [
      //     Text('my',style: TextStyle(fontSize: 23),),
      //     Text('name', style: TextStyle(fontSize: 25),),
      //     Text('is' ,style: TextStyle(fontSize: 25),),
      //     Text('zain',style: TextStyle(fontSize: 25),),
      //     ElevatedButton(onPressed: (){
      //
      //     },child: Text('click'),)
      //   ],
      // )

      Center(
        child: InkWell(
        onTap: (){
          print("hello world tapped");
        },
          onDoubleTap: ()
          {
            print("hello double tapped");
          },
          child: Container(
            height: 200,
            width: 200,
            color: Colors.blueAccent,
            child:InkWell
              (
              onTap: ()
                {
                  print ("Text tapped");
                },
                child: Center(child: Text("Click here",style: TextStyle(fontSize: 26,fontWeight:FontWeight.bold ), ))),
          ),
        ),
      )

    );
  }
}




