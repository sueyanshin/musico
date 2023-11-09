import 'dart:ui';
import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class AlbumPage extends StatefulWidget {
  final ImageProvider image;
  const AlbumPage({super.key, required this.image});

  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  // ScrollController scrollController;
  // double imageSize = 0;
  // double initialSize = 240;
  // double containerHeight = 500;
  // double containerinitalHeight = 500;
  // double imageOpacity = 1;
  // bool showTopBar = false;
  // @override
  // void initState() {
  //   imageSize = initialSize;
  //   scrollController = ScrollController()
  //     ..addListener(() {
  //       imageSize = initialSize - scrollController.offset;
  //       if (imageSize < 0) {
  //         imageSize = 0;
  //       }
  //       containerHeight = containerinitalHeight - scrollController.offset;
  //       if (containerHeight < 0) {
  //         containerHeight = 0;
  //       }
  //       imageOpacity = imageSize / initialSize;
  //       if (scrollController.offset > 224) {
  //         showTopBar = true;
  //       } else {
  //         showTopBar = false;
  //       }
  //       print(scrollController.offset);
  //       setState(() {});
  //     });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          color: teal,
        ),
        SafeArea(
          child: SingleChildScrollView(
            // controller: scrollController,
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  clipBehavior: Clip.none,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        Colors.black.withOpacity(0),
                        Colors.black.withOpacity(0),
                        Colors.black.withOpacity(1),
                      ])),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(.5),
                                offset: Offset(0, 20),
                                blurRadius: 32,
                                spreadRadius: 16)
                          ]),
                          child: Image(
                            image: widget.image,
                            width: MediaQuery.of(context).size.width - 120,
                            height: MediaQuery.of(context).size.width - 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  Image(
                                    image: AssetImage('assets/images/logo.png'),
                                    width: 32,
                                    height: 32,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    'Musico',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Text(
                                '190 490 likes, 5h 33m',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.favorite_outline),
                                      const SizedBox(
                                        width: 16,
                                      ),
                                      Icon(Icons.more_horiz),
                                    ],
                                  ),
                                  Positioned(
                                      right: 0,
                                      bottom: 0,
                                      child: Stack(
                                        alignment: Alignment.bottomRight,
                                        children: [
                                          Container(
                                            width: 64,
                                            height: 64,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: green,
                                            ),
                                            child: Icon(
                                              Icons.play_arrow,
                                              size: 38,
                                            ),
                                          ),
                                          Container(
                                            width: 24,
                                            height: 24,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: white,
                                            ),
                                            child: Icon(
                                              Icons.shuffle,
                                              color: Colors.black,
                                              size: 14,
                                            ),
                                          )
                                        ],
                                      ))
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  color: Colors.black,
                  height: 500,
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
