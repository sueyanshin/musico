import 'package:flutter/material.dart';
import 'Home/my_main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToMain(); // Delayed navigation
  }

  void _navigateToMain() {
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        // Ensure the widget is still mounted before navigation
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => MyMain()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              "https://www.nationalgeographic.com.es/medio/2023/06/01/istock-604372058-1_97074090_230601162045_800x800.jpg",
              width: 100,
              height: 100,
            ),
            const Text(
              "Musico",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
