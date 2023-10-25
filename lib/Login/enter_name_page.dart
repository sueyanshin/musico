import 'package:flutter/material.dart';
import 'package:musico/provider/username_provider.dart';
import 'package:musico/pages/splash_screen.dart';
import 'package:provider/provider.dart';

class EnterName extends StatelessWidget {
  EnterName({super.key});

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<UserNameProvider>(
      builder: (context, value, child) => Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Welcome to musico'),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _controller,
                  decoration:
                      const InputDecoration(labelText: 'Enter Your Name'),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      value.setName(_controller.text);
                      print(value.name);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SplashScreen(),
                          ));
                    },
                    child: const Text('Next'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
