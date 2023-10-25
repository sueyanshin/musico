import 'package:flutter/material.dart';
import '../models/youtube_item.dart';

class SearchModel extends ChangeNotifier {
  String _query = '';
  List<YoutubeItem> _results = [];

  String get query => _query;

  List<YoutubeItem> get results => _results;
  void setQuery(String query) {
    this._query = query;
    notifyListeners();
  }

  void setResults(List<YoutubeItem> results) {
    _results = results;
    notifyListeners();
  }
}
