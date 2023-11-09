// import 'dart:async';
// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// import 'Home/my_main.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key}) : super(key: key);

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen>
//     with TickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;
//   late Timer _timer;

//   @override
//   void initState() {
//     super.initState();
//     // Start the timer for __ seconds
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 2),
//     );
//     _animation = CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeInCubic,
//     );
//     _controller.forward();

//     _timer = Timer(const Duration(seconds: 4), () {
//       setState(() {
//         _controller.reverse(); // Start fade-out animation
//       });

//       Future.delayed(const Duration(seconds: 2), () {
//         Navigator.of(context).pushReplacement(
//           MaterialPageRoute(builder: (context) => MyMain()),
//         );
//       });
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose(); // Dispose of the animation controller
//     _timer.cancel(); // Cancel the timer to avoid memory leaks
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:
//         FadeTransition(
//           opacity: _animation,
//           child:  Stack(fit: StackFit.loose, children: [
//         // Home page with blurred background
//         MyMain(),
//       Container(
//             decoration: const BoxDecoration(color: Colors.transparent),
//             child: BackdropFilter(
//               filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
//               child: Center(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Lottie.asset('assets/lottie/tape.json', width: 150),
//                     const Text(
//                       "Musico",
//                       style:
//                           TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
//                     ),
//                     const Text('Developed by ငယ်စူး')
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ))
//       ])

//   }
// }

import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'Home/my_main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;
  @override
  void initState() {
    super.initState();
    // Start the timer for __ seconds
    _timer = Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => MyMain()),
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer to avoid memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(fit: StackFit.loose, children: [
        // Home page with blurred background
        MyMain(),
        Container(
          decoration: const BoxDecoration(color: Colors.transparent),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Image(
                  //   image: AssetImage('assets/images/tape.png'),
                  // ),
                  Lottie.asset('assets/lottie/tape.json', width: 150),
                  const Text(
                    "Musico",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  const Text('Developed by ငယ်စူး')
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

// extension on double {
//   Duration get seconds => Duration(seconds: this.toInt());
// }
