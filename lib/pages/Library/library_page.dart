import 'package:flutter/material.dart';
import 'package:musico/models/library_item.dart';

class LibraryPage extends StatelessWidget {
  LibraryPage({super.key});
  final appBar = "Library";

  List items = [
    LibraryItem(icon: Icons.history, text: "History"),
    LibraryItem(icon: Icons.favorite, text: "Favourites"),
    LibraryItem(icon: Icons.download, text: "Downloads"),
    LibraryItem(icon: Icons.playlist_add_check_circle, text: "Playist"),
    LibraryItem(icon: Icons.add_chart_sharp, text: "Status")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          appBar,
          style: const TextStyle(fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {},
            leading: Icon(items[index].icon),
            title: Text(items[index].text),
          );
        },
      ),
    );
  }
}
