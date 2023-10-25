import 'package:flutter/material.dart';
import 'package:musico/provider/spotify_tab_index_provider.dart';
import 'package:provider/provider.dart';
import '../../models/spotify_music.dart';

class TopChart extends StatefulWidget {
  TopChart({super.key});

  @override
  State<TopChart> createState() => _TopChartState();
}

class _TopChartState extends State<TopChart> {
  List<SpotifyMusic> musicList = [
    SpotifyMusic(
        title: 'Mariposa',
        artist: 'Rex Orange Country',
        image:
            "https://www.nationalgeographic.com.es/medio/2023/06/01/istock-604372058-1_97074090_230601162045_800x800.jpg",
        audioUrl: ""),
    SpotifyMusic(
        title: 'Mariposa',
        artist: 'Rex Orange Country',
        image:
            "https://www.nationalgeographic.com.es/medio/2023/06/01/istock-604372058-1_97074090_230601162045_800x800.jpg",
        audioUrl: ""),
    SpotifyMusic(
        title: 'Mariposa',
        artist: 'Rex Orange Country',
        image:
            "https://www.nationalgeographic.com.es/medio/2023/06/01/istock-604372058-1_97074090_230601162045_800x800.jpg",
        audioUrl: ""),
  ];

  @override
  Widget build(BuildContext context) {
    const appBar = "Spotify Charts";
    return Consumer<SpotifyTabIndexProvider>(
      builder: (context, value, child) => DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              title: const Text(
                appBar,
                style: TextStyle(fontSize: 18),
              ),
              centerTitle: true,
              actions: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.gps_fixed))
              ],
              bottom: TabBar(
                  onTap: (i) {
                    value.setIndex(i);
                    print(value.currentIndex);
                  },
                  dividerColor: Colors.transparent,
                  tabs: const [
                    Padding(padding: EdgeInsets.all(8), child: Text('Local')),
                    Padding(padding: EdgeInsets.all(8), child: Text('Global'))
                  ]),
            ),
            body: value.currentIndex == 0
                ? ListView.builder(
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
                              )),
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
                          }));
                    })
                : Text('Global'),
          )),
    );
  }
}

// DefaultTabController(
//         length: 2,
//         child: Scaffold(
//           appBar: AppBar(
//             title: const Text(
//               appBar,
//               style: TextStyle(fontSize: 18),
//             ),
//             centerTitle: true,
//             actions: [
//               IconButton(onPressed: () {}, icon: const Icon(Icons.gps_fixed))
//             ],
//             bottom: TabBar(
//                 onTap: (value) {
//                   setState(() {
//                     _currentTab = value;
//                   });
//                 },
//                 dividerColor: Colors.transparent,
//                 tabs: const [
//                   Padding(padding: EdgeInsets.all(8), child: Text('Local')),
//                   Padding(padding: EdgeInsets.all(8), child: Text('Global'))
//                 ]),
//           ),
//           body: _currentTab == 0
//               ? ListView.builder(
//                   itemCount: musicList.length,
//                   itemBuilder: (context, index) {
//                     final music = musicList[index];
//                     return ListTile(
//                         onTap: () {},
//                         leading: ClipRRect(
//                             borderRadius: BorderRadius.circular(10),
//                             child: Image.network(
//                               music.image,
//                               fit: BoxFit.cover,
//                             )),
//                         title: Text(music.title),
//                         subtitle: Text(music.artist),
//                         trailing: PopupMenuButton(itemBuilder: (context) {
//                           return <PopupMenuEntry>[
//                             PopupMenuItem(
//                               onTap: () {},
//                               value: 'spotify',
//                               child: const Text('Open in Spotify'),
//                             ),
//                           ];
//                         }));
//                   })
//               : Text('Global'),
//         ));