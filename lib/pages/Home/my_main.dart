import 'package:flutter/material.dart';
import 'package:musico/pages/search_page.dart';
import 'package:musico/provider/bottom_tab_index_provider.dart';
import 'package:musico/pages/Home/home_page.dart';
import 'package:musico/pages/Library/library_page.dart';
import 'package:musico/pages/TopChart/top_charts_page.dart';
import 'package:musico/pages/Youtube/youtube_page.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyMain extends StatelessWidget {
  MyMain({super.key});

  final List<Widget> _pages = [
    HomePage(),
    TopChart(),
    SearchPage(),
    LibraryPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomTabIndexProvider>(
      builder: (context, value, child) => Scaffold(
          bottomNavigationBar: SalomonBottomBar(
              selectedItemColor: Colors.teal,
              currentIndex: value.currentIndex,
              onTap: (i) {
                value.setIndex(i);
              },
              items: [
                SalomonBottomBarItem(
                    icon: const Icon(Icons.home), title: const Text("Home")),
                SalomonBottomBarItem(
                    icon: const Icon(Icons.show_chart),
                    title: const Text("Top Charts")),
                SalomonBottomBarItem(
                    icon: const FaIcon(FontAwesomeIcons.youtube),
                    title: const Text("Youtube")),
                SalomonBottomBarItem(
                    icon: const Icon(Icons.library_music),
                    title: const Text("Library")),
              ]),
          body: SafeArea(child: _pages[value.currentIndex])),
    );
  }
}
