import 'package:shared_preferences/shared_preferences.dart';

void bookMarkList(List<String> link, List<String> bookmarkName) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setStringList('list', link);
  prefs.setStringList('bookmarkName', bookmarkName);
}

Future<List<String>?> readbookMarkList() async {
  final prefs = await SharedPreferences.getInstance();
  List<String>? read = prefs.getStringList('list');
  return read;
}

Future<List<String>?> readbookMarkName() async {
  final prefs = await SharedPreferences.getInstance();
  List<String>? read = prefs.getStringList('bookmarkName');
  return read;
}

void bookmarkNameList(List<String> name) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setStringList('name', name);
}

Future<List<String>?> readBookMarkNameList() async {
  final prefs = await SharedPreferences.getInstance();
  List<String>? nameList = prefs.getStringList('name');
  return nameList;
}
