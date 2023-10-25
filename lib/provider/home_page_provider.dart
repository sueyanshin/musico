import 'package:flutter/widgets.dart';

class HomePageProvider extends ChangeNotifier {
  String _greet = "Hello";
// final UserNameProvider userNameProvider;

// HomePageProvider(this.userNameProvider){
//   updateGreet();
// };
  String get greet => _greet;

  void updateGreeting() {
    final now = DateTime.now();
    final currentHour = now.hour;

    if (currentHour >= 0 && currentHour < 12) {
      _greet = "Good morning";
      notifyListeners();
    } else if (currentHour >= 12 && currentHour < 17) {
      _greet = "Good afternoon";
      notifyListeners();
    } else {
      _greet = "Good evening";
      notifyListeners();
    }
  }
}
