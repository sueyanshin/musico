import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class MySliverAppBar extends StatelessWidget {
  String greeting, username;
  MySliverAppBar({required this.greeting, required this.username, super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu),
            ),
            // systemOverlayStyle: SystemUiOverlayStyle.dark,
            // centerTitle: false,
            backgroundColor: Colors.red,
            expandedHeight: 50,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
                centerTitle: false,
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(greeting,
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                    Text(username,
                        style: const TextStyle(
                            color: Colors.teal,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                  ],
                )),
          ),
          SliverPersistentHeader(
            delegate: _SearchBarDeligate(),
            floating: false,
            pinned: true,
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
            ListTile(
              title: Text(
                'Item $index',
                style: TextStyle(color: Colors.white),
              ),
            );
          }, childCount: 50))
        ],
      ),
    );
  }
}

class _SearchBarDeligate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: TextField(
        decoration: InputDecoration(
            hintText: 'Search',
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(25))),
      ),
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 60.0;

  @override
  // TODO: implement minExtent
  double get minExtent => 60.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return false;
  }
}
