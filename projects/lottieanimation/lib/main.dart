import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lottie Animations',
      home: LottieAnime(),
    );
  }
}
class LottieAnime extends StatefulWidget {
  @override
  State<LottieAnime> createState() => _LottieAnimeState();
}

class _LottieAnimeState extends State<LottieAnime> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[300],
      body: Center(
        child: Lottie.asset('assets/lottie/Animation.json'),
      ),
    );
  }
}


