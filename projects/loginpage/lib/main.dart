import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A174E),
      appBar: AppBar(
        title: const Text("Login Page"),
        centerTitle: true,
        backgroundColor:  Color(0xFFF5D042),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
             SizedBox(height: 30),
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('images/profilepic.jpg'),
            ),
            const SizedBox(height: 30),
            const TextField(
              decoration: InputDecoration(
                labelText: "Email Address",
                hintText: "zain@gmail.com",
                border: OutlineInputBorder(),
                fillColor: Colors.yellow,
                filled: true,
              ),
            ),
             SizedBox(height: 30),
            TextField(
              decoration: InputDecoration(
                labelText: "Password",
                hintText: "zain1234",
                border: OutlineInputBorder(),
                fillColor: Colors.yellow,
                filled: true,
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              child:Text(
                'Log In',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(150, 50),
                backgroundColor: const Color(0xFFF5D042),
              ),
              onPressed: () {
                // Define your button action here.
              },
            )
          ],
        ),
      ),
    );
  }
}

