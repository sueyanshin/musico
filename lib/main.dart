import 'package:flutter/material.dart';
import 'package:musico/provider/bottom_tab_index_provider.dart';
import 'package:musico/provider/home_page_provider.dart';
import 'package:musico/provider/search_model.dart';
import 'package:musico/provider/spotify_tab_index_provider.dart';
import 'package:musico/provider/username_provider.dart';
import 'package:musico/Login/enter_name_page.dart';
import 'package:musico/pages/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => BottomTabIndexProvider()),
      ChangeNotifierProvider(create: (context) => SpotifyTabIndexProvider()),
      ChangeNotifierProvider(create: (context) => UserNameProvider()),
      ChangeNotifierProvider(create: (context) => HomePageProvider()),
      ChangeNotifierProvider(create: (context) => SearchModel()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appName = "Musico";
    return MaterialApp(
      title: appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: Colors.tealAccent,
        ),
        useMaterial3: true,
      ),
      home: const CheckApp(),
    );
  }
}

class CheckApp extends StatelessWidget {
  const CheckApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserNameProvider>(builder: (context, value, child) {
      String userName = value.name;

// check if userName exist or not
      if (userName.isNotEmpty) {
        return const SplashScreen();
      } else {
        return EnterName();
      }
    });
  }
}
