import 'package:demo29/utility/sharedPreferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class SearchProvider extends ChangeNotifier {
  TextEditingController txtBookMarkName = TextEditingController();
  TextEditingController txtBookMarkLink = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool count = false;
  List<String>? bookmarkName = [];
  List<String>? bookMarks = [];

  bool refreshButton = false;
  bool backButton = false;
  bool forwordButton = false;
  late PullToRefreshController pullToRefreshController;

  String searchData = 'https://www.google.com/';
  TextEditingController txtSearch = TextEditingController();

  InAppWebViewController? inAppWebViewController;
  double progress = 0.0;

  void allDelete() {
    bookmarkName!.clear();
    bookMarks!.clear();
    notifyListeners();
  }

  void deleteButton(index) {
    bookmarkName!.removeAt(index);
    bookMarks!.removeAt(index);
    notifyListeners();
  }

  void changeSearch(String data) {
    searchData = data;
    notifyListeners();
  }

  void bookMarkName(nameData) {
    txtBookMarkName = TextEditingController(text: '${nameData}');
    notifyListeners();
  }

  void addText(data) {
    Uri? uri = data;
    txtBookMarkLink = TextEditingController(text: "$uri");
    notifyListeners();
  }

  void changeProgress(double data) {
    progress = data;
    notifyListeners();
  }

  Future backButtonFalse() async {
    backButton = false;
    notifyListeners();
  }

  Future backButtonTrue() async {
    backButton = true;
    notifyListeners();
  }

  Future forwordButtonFalse() async {
    forwordButton = false;
    notifyListeners();
  }

  Future forwordButtonTrue() async {
    forwordButton = true;
    notifyListeners();
  }

  void countFunction(bool newValue) {
    count = newValue;
    count = !count;
    notifyListeners();
  }

  void save(String links) {
    bookMarks!.add(links);

    notifyListeners();
  }

  void saveBookName(String bookMarkName) {
    bookmarkName!.add(bookMarkName);
    notifyListeners();
  }

  void readBookMark() async {
    bookMarks = (await readbookMarkList())!;
    notifyListeners();
  }

  void readBookMarkname() async {
    bookmarkName = (await readbookMarkName())!;
    notifyListeners();
  }
}
