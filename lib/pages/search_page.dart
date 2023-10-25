import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../models/youtube_item.dart';
import '../provider/search_model.dart';

class SearchPage extends StatefulWidget {
  SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();

  // Define a SreamController for real-time update
  final StreamController<List<YoutubeItem>> _searchStreamController =
      StreamController<List<YoutubeItem>>();

  void _searchVideos(BuildContext context) async {
    String query = _searchController.text;
    String apiKey = 'AIzaSyCNCbIWX4eVoO-RmeXYQb0t_gH_AQm0J4U';
    String url = 'https://www.googleapis.com/youtube/v3/search?'
        'key=$apiKey'
        '&q=$query'
        '&part=snippet'
        '&maxResults=50';

    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      List<YoutubeItem> videos = [];

      for (var item in data['items']) {
        final snippet = item['snippet'];
        final id = item['id'];

        // Check if the item represents a video
        if (id != null && id['kind'] == 'youtube#video') {
          // Video ID is present for videos, so you can access it
          videos.add(YoutubeItem(
            title: snippet['title'],
            videoId: id['videoId'],
            thumbnailUrl: snippet['thumbnails']['default']['url'],
          ));
        } else {
          // Handle non-video items (e.g., channels or playlists) or simply skip them
          // Optionally, you can print a message to indicate that these are non-video items
          print('Non-video item: $item');
        }
      }

      // Use the SearchModel to update the results
      Provider.of<SearchModel>(context, listen: false).setResults(videos);
    } else {
      print('Error :${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final searchModel = Provider.of<SearchModel>(context);
    return Scaffold(
        body: Column(
      children: [
        TextField(
          controller: _searchController,
          decoration: const InputDecoration(
              iconColor: Colors.tealAccent,
              icon: Icon(Icons.search),
              hintText: 'Search on youtube'),
          onChanged: (query) {
            // Update the search query in the SearchModel
            searchModel.setQuery(query);
            // Perform search as the user types
            _searchVideos(context);
            // Perform search (you can debounce this for better performance)
            // _searchVideos(searchModel);
          },
        ),
        Expanded(
          child: StreamBuilder<List<YoutubeItem>>(
            stream: _searchStreamController.stream,
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data != null) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final video = snapshot.data![index];
                    return ListTile(
                      leading: Image.network(video.thumbnailUrl),
                      title: Text(video.title),
                      onTap: () {},
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text('Error : ${snapshot.error}');
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        )
      ],
    ));
  }
}
