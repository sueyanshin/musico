import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:musico/pages/Youtube/youtube_page.dart';
import 'package:musico/pages/search_page.dart';
import 'package:musico/provider/bottom_tab_index_provider.dart';
import 'package:musico/pages/Home/my_home.dart';
import 'package:musico/pages/Library/library_page.dart';
import 'package:musico/pages/TopChart/top_charts_page.dart';
import 'package:provider/provider.dart';

class MyMain extends StatelessWidget {
  MyMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomTabIndexProvider>(
      builder: (context, value, child) => Scaffold(
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(color: Colors.transparent),
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12)),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 100.0),
                child: BottomNavigationBar(
                    backgroundColor: Colors.transparent,
                    selectedItemColor: Colors.white,
                    unselectedItemColor: Colors.white38,
                    currentIndex: value.currentIndex,
                    onTap: (i) {
                      value.setIndex(i);
                    },
                    items: const [
                      BottomNavigationBarItem(
                          icon: Icon(Icons.home), label: "Home"),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.show_chart), label: "Top Chart"),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.search_outlined), label: "Search"),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.library_music), label: "Library"),
                    ]),
              ),
            ),
          ),
          body: Stack(
            children: [
              RenderView(tabIndex: 0, view: const HomePage()),
              RenderView(tabIndex: 1, view: TopChart()),
              RenderView(tabIndex: 2, view: YoutubePage()),
              RenderView(tabIndex: 3, view: LibraryPage()),
            ],
          )),
    );
  }
}

class RenderView extends StatelessWidget {
  int tabIndex;
  Widget view;
  RenderView({
    required this.tabIndex,
    required this.view,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    int _currentIndex =
        Provider.of<BottomTabIndexProvider>(context, listen: false)
            .currentIndex;
    return Stack(
      children: [
        IgnorePointer(
          ignoring: _currentIndex != tabIndex,
          child: Opacity(
            opacity: _currentIndex == tabIndex ? 1 : 0,
            child: view,
          ),
        )
      ],
    );
  }
}
