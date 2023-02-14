import 'package:flutter/cupertino.dart';

class BookMarkProvider extends ChangeNotifier {
  var num = 0;

  void link_index(newValue) {
    num = newValue;
    notifyListeners();
  }
}
