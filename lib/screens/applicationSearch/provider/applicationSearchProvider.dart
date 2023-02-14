import 'package:flutter/cupertino.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class ApplicationSearchProvider extends ChangeNotifier {
  String searchData = 'https://www.google.com/';
  TextEditingController txtSearch = TextEditingController();
  InAppWebViewController? inAppWebViewController;
  double progress = 0.0;

  void changeSearch(String data) {
    searchData = data;
    notifyListeners();
  }

  void changeProgress(double data) {
    progress = data;
    notifyListeners();
  }
}
