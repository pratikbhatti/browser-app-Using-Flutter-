import 'package:demo29/screens/bookmark/provider/bookmarkProvider.dart';
import 'package:demo29/screens/search/provider/searchProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';

class BookMarkViewPage extends StatefulWidget {
  const BookMarkViewPage({super.key});

  @override
  State<BookMarkViewPage> createState() => _BookMarkViewPageState();
}

class _BookMarkViewPageState extends State<BookMarkViewPage> {
  SearchProvider? providerTrue;
  SearchProvider? providerFalse;
  BookMarkProvider? providerBTrue;
  BookMarkProvider? providerBFalse;

  @override
  Widget build(BuildContext context) {
    providerTrue = Provider.of<SearchProvider>(context, listen: true);
    providerFalse = Provider.of<SearchProvider>(context, listen: false);
    providerBTrue = Provider.of<BookMarkProvider>(context, listen: true);
    providerBFalse = Provider.of<BookMarkProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        body: InAppWebView(
          initialUrlRequest: URLRequest(
            url: Uri.parse('${providerTrue!.bookMarks?[providerBTrue!.num]}'),
          ),
        ),
      ),
    );
  }
}
