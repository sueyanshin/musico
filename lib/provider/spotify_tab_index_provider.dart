import 'package:flutter/widgets.dart';

class SpotifyTabIndexProvider extends ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void setIndex(index) {
    _currentIndex = index;
    notifyListeners();
  }
}
