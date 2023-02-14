import 'package:demo29/screens/bookMarkView/view/bookMarkViewPage.dart';
import 'package:demo29/screens/bookmark/provider/bookmarkProvider.dart';
import 'package:demo29/screens/search/provider/searchProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';

class BookMarkPage extends StatefulWidget {
  const BookMarkPage({super.key});

  @override
  State<BookMarkPage> createState() => _BookMarkPageState();
}

class _BookMarkPageState extends State<BookMarkPage> {
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
          body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 60, left: 60),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onPressed: () {
                providerTrue!.allDelete();
              },
              child: Text("Clear Bookmark"),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
              itemCount: providerFalse?.bookmarkName?.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    providerBTrue!.link_index(index);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookMarkViewPage(),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 10,
                    child: ListTile(
                        title: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                              overflow: TextOverflow.ellipsis,
                              "${providerTrue?.bookmarkName?[index]}"),
                        ),
                        subtitle: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                              overflow: TextOverflow.ellipsis,
                              "${providerTrue?.bookMarks?[index]}"),
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            providerTrue!.deleteButton(index);
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.redAccent.shade100,
                          ),
                        )

                        // title: InkWell(
                        //   onTap: () {
                        //     providerBTrue!.link_index(index);
                        //     Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //         builder: (context) => BookMarkViewPage(),
                        //       ),
                        //     ); // providerFalse!.inAppWebViewController!.loadUrl(
                        //     //   urlRequest: URLRequest(
                        //     //     url: Uri.parse("${providerTrue?.bookMarks?[index]}"),
                        //     //   ),
                        //     // );
                        //   },
                        //   child: Text("${providerTrue?.bookMarks?[index]}"),
                        // ),
                        ),
                  ),
                );
              },
            ),
          ),
        ],
      )),
    );
  }
}
