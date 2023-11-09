import 'package:flutter/material.dart';
import 'package:musico/pages/Home/album_page.dart';
import '../../widgets/widgets.dart';
// import 'package:musico/provider/home_page_provider.dart';
// import 'package:musico/provider/username_provider.dart';
// import 'package:provider/provider.dart';
// import '../../data/sample_music_data.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(alignment: Alignment.topLeft, children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * .6,
          decoration: const BoxDecoration(color: Color(0xFf1C7A74)),
        ),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Colors.black.withOpacity(0),
                  Colors.black.withOpacity(.9),
                  Colors.black.withOpacity(1),
                  Colors.black.withOpacity(1),
                  Colors.black.withOpacity(1),
                ])),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Recent Tracks',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const Row(
                          children: [
                            Icon(Icons.history),
                            SizedBox(width: 20),
                            Icon(Icons.settings)
                          ],
                        )
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(children: [
                      AlbumCard(
                          label: "Top 50-Global",
                          image:
                              AssetImage('assets/images/img-top50-global.jpg'),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AlbumPage(
                                    image: AssetImage(
                                        'assets/images/img-top50-global.jpg'),
                                  ),
                                ));
                          }),
                      SizedBox(width: 16),
                      AlbumCard(
                          label: "Liked Songs",
                          image:
                              AssetImage('assets/images/img-liked-song.jpeg'),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AlbumPage(
                                    image: AssetImage(
                                        'assets/images/img-liked-song.jpeg'),
                                  ),
                                ));
                          }),
                      SizedBox(width: 16),
                      AlbumCard(
                          label: "Best of 2023",
                          image: AssetImage('assets/images/ghost.jpg'),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AlbumPage(
                                    image:
                                        AssetImage('assets/images/ghost.jpg'),
                                  ),
                                ));
                          }),
                      SizedBox(width: 16),
                      AlbumCard(
                          label: "Best of 2023",
                          image: AssetImage('assets/images/ghost.jpg'),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AlbumPage(
                                    image:
                                        AssetImage('assets/images/ghost.jpg'),
                                  ),
                                ));
                          }),
                      SizedBox(width: 16),
                      AlbumCard(
                          label: "Best of 2023",
                          image: AssetImage('assets/images/ghost.jpg'),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AlbumPage(
                                    image:
                                        AssetImage('assets/images/ghost.jpg'),
                                  ),
                                ));
                          }),
                      SizedBox(width: 16),
                      AlbumCard(
                          label: "Best of 2023",
                          image: AssetImage('assets/images/ghost.jpg'),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AlbumPage(
                                    image:
                                        AssetImage('assets/images/ghost.jpg'),
                                  ),
                                ));
                          }),
                    ]),
                  ),
                  const SizedBox(height: 32),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Good Morning',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RowAlbumCard(
                              image: AssetImage(
                                  "assets/images/img-top50-global.jpg"),
                              label: "Top 50 - Global",
                            ),
                            SizedBox(width: 16),
                            RowAlbumCard(
                              image: AssetImage(
                                  "assets/images/img-top50-global.jpg"),
                              label: "Top 50 - Global",
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RowAlbumCard(
                              image: AssetImage(
                                  "assets/images/img-top50-global.jpg"),
                              label: "Top 50 - Global",
                            ),
                            SizedBox(width: 16),
                            RowAlbumCard(
                              image: AssetImage(
                                  "assets/images/img-top50-global.jpg"),
                              label: "Top 50 - Global",
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RowAlbumCard(
                              image: AssetImage(
                                  "assets/images/img-top50-global.jpg"),
                              label: "Top 50 - Global",
                            ),
                            SizedBox(width: 16),
                            RowAlbumCard(
                              image: AssetImage(
                                  "assets/images/img-top50-global.jpg"),
                              label: "Top 50 - Global",
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "Based on your recent listening",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      const SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(children: [
                          SongCard(
                              image: AssetImage("assets/images/mariposa.jpg"),
                              label: "Mariposa"),
                          const SizedBox(width: 16),
                          SongCard(
                              image: AssetImage("assets/images/mariposa.jpg"),
                              label: "Mariposa"),
                          const SizedBox(width: 16),
                          SongCard(
                              image: AssetImage("assets/images/mariposa.jpg"),
                              label: "Mariposa")
                        ]),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
