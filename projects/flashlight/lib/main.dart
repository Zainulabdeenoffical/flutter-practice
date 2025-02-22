import 'package:flutter/material.dart';
import 'package:torch_light/torch_light.dart'; // Added import for TorchLight

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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isTorchOn = false; // Track torch state

  Future<void> toggleTorch() async {
    try {
      if (isTorchOn) {
        await TorchLight.disableTorch(); // Turn off torch
      } else {
        await TorchLight.enableTorch(); // Turn on torch
      }
      setState(() {
        isTorchOn = !isTorchOn; // Update state
      });
    } catch (e) {
      print("Torch error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Flutter Container"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: toggleTorch,
              child: Text(isTorchOn ? "Turn Off Flashlight" : "Turn On Flashlight"),
            ),
          ],
        ),
      ),
    );
  }
}
