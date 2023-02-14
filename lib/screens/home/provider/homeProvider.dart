import 'package:demo29/screens/application/view/applicationPage.dart';
import 'package:demo29/screens/search/views/searchPage.dart';
import 'package:flutter/cupertino.dart';

class HomeProvider extends ChangeNotifier {
  int selectedIndex = 0;
  List pages = [
    SearchPage(),
    ApplicationPage(),
  ];

  void changeIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
