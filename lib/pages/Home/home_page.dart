import 'package:flutter/material.dart';
import 'package:musico/provider/home_page_provider.dart';
import 'package:musico/provider/username_provider.dart';
import 'package:provider/provider.dart';
import '../../data/sample_music_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      final homePageProvider =
          Provider.of<HomePageProvider>(context, listen: false);
      homePageProvider.updateGreeting();
    });
  }

  @override
  Widget build(BuildContext context) {
    final userNameProvider =
        Provider.of<UserNameProvider>(context, listen: false);
    final username = userNameProvider.name;
    final greetProvider = Provider.of<HomePageProvider>(context, listen: false);
    final greet = greetProvider.greet;

    return Scaffold(
      appBar: AppBar(
          title: Text(
            greet,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search))
          ]),
      body: Consumer<HomePageProvider>(
        builder: (context, value, child) => Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text(value.greet,
                //     style: const TextStyle(
                //         fontSize: 30, fontWeight: FontWeight.bold)),
                Text(username,
                    style: const TextStyle(
                        color: Colors.teal,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                const Text('Continue Listening',
                    style: TextStyle(
                        color: Colors.teal,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                ListView.builder(
                  shrinkWrap:
                      true, // Ensure the ListView does not take up extra space
                  itemCount: musicList.length,
                  itemBuilder: (context, index) {
                    final music = musicList[index];
                    return ListTile(
                      onTap: () {},
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          music.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(music.title),
                      subtitle: Text(music.artist),
                      trailing: PopupMenuButton(itemBuilder: (context) {
                        return <PopupMenuEntry>[
                          PopupMenuItem(
                            onTap: () {},
                            value: 'spotify',
                            child: const Text('Open in Spotify'),
                          ),
                        ];
                      }),
                    );
                  },
                ),

                const Text('Top Chart'),

                //horizontal playlist

                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: musicList.length,
                    itemBuilder: (context, index) {
                      final music = musicList[index];
                      return Container(
                        padding: const EdgeInsets.only(right: 20),
                        width: 100,
                        child: Column(
                          children: [
                            Image.network(music.image),
                            Text(music.artist)
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: musicList.length,
                    itemBuilder: (context, index) {
                      final music = musicList[index];
                      return InkWell(
                        onTap: () {
                          print(music.artist);
                        },
                        child: Container(
                          width: 120,
                          margin: const EdgeInsets.only(right: 20),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            children: [
                              Image.network(music.image),
                              Text(
                                music.artist,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
