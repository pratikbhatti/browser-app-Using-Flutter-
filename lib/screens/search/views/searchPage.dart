import 'package:demo29/screens/bookmark/view/bookmarkPage.dart';
import 'package:demo29/screens/search/provider/searchProvider.dart';

import 'package:demo29/utility/sharedPreferences.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  SearchProvider? providerTrue;
  SearchProvider? providerFalse;

  @override
  void initState() {
    super.initState();
    providerFalse?.pullToRefreshController = PullToRefreshController(
      onRefresh: () async {
        Provider.of<SearchProvider>(context, listen: false)
            .inAppWebViewController
            ?.loadUrl(
              urlRequest: URLRequest(
                url: await Provider.of<SearchProvider>(context, listen: false)
                    .inAppWebViewController
                    ?.getUrl(),
              ),
            );
      },
    );

    Provider.of<SearchProvider>(context, listen: false).readBookMark();
    Provider.of<SearchProvider>(context, listen: false).readBookMarkname();
  }

  @override
  Widget build(BuildContext context) {
    providerTrue = Provider.of<SearchProvider>(context, listen: true);
    providerFalse = Provider.of<SearchProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: providerFalse!.formKey,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 8, right: 8),
                child: Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height / 17.5,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () async {
                          if (await providerFalse!.inAppWebViewController!
                              .canGoBack()) {
                            providerFalse!.inAppWebViewController!.goBack();
                            return providerTrue!.backButtonFalse();
                          } else {
                            return providerTrue!.backButtonTrue();
                          }
                        },
                        icon: (providerTrue!.backButton == false)
                            ? Icon(Icons.arrow_back)
                            : Icon(
                                Icons.arrow_back,
                                color: Colors.grey,
                              ),

                        // (providerTrue!.backButton == false) ? icon: const Icon(Icons.arrow_back) : icon: Icon(Icons.arrow_back,color: Colors.grey,);
                      ),
                      IconButton(
                        onPressed: () async {
                          if (await providerFalse!.inAppWebViewController!
                              .canGoForward()) {
                            providerFalse!.inAppWebViewController!.goForward();
                            return providerTrue!.forwordButtonFalse();
                          } else {
                            return providerTrue!.forwordButtonTrue();
                          }
                        },
                        icon: (providerTrue!.forwordButton == false)
                            ? Icon(Icons.arrow_forward)
                            : Icon(
                                Icons.arrow_forward,
                                color: Colors.grey,
                              ),
                        // icon: Icon(Icons.arrow_forward),
                      ),
                      InkWell(
                        onTap: () {
                          providerFalse!.countFunction(providerTrue!.count);
                          providerFalse!.inAppWebViewController!.reload();
                        },
                        child: (providerFalse!.count == false)
                            ? Image.asset(
                                'assets/images/refresh1.png',
                                height: MediaQuery.of(context).size.height / 10,
                                width: MediaQuery.of(context).size.width / 13,
                              )
                            : Image.asset(
                                'assets/images/refresh2.png',
                                height: MediaQuery.of(context).size.height / 10,
                                width: MediaQuery.of(context).size.width / 13,
                              ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                          height: MediaQuery.of(context).size.height / 17.5,
                          width: MediaQuery.of(context).size.width / 5.5,
                          child: TextFormField(
                            textInputAction: TextInputAction.search,
                            onFieldSubmitted: (value) {
                              providerFalse!
                                  .changeSearch(providerTrue!.txtSearch.text);
                              providerFalse!.inAppWebViewController!.loadUrl(
                                urlRequest: URLRequest(
                                  url: Uri.parse(
                                      'https://www.google.com/search?q=${providerTrue!.txtSearch.text}'),
                                ),
                              );
                            },
                            controller: providerTrue!.txtSearch,
                            decoration: InputDecoration(
                              hintText: 'Enter Search Bar',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          providerFalse!
                              .changeSearch(providerTrue!.txtSearch.text);
                          providerFalse!.inAppWebViewController!.loadUrl(
                            urlRequest: URLRequest(
                              url: Uri.parse(
                                  'https://www.google.com/search?q=${providerTrue!.txtSearch.text}'),
                            ),
                          );
                        },
                        icon: Icon(Icons.search),
                      ),
                      IconButton(
                        onPressed: () async {
                          // providerTrue!.save(
                          //     "https://www.google.com/search?q=${providerTrue!.txtSearch.text}");
                          // bookMarkList(providerTrue!.bookMarks!);
                          // providerTrue!
                          //     .linkAddText(providerTrue!.txtSearch.text);
                          // if (providerTrue!.txtSearch.text.isEmpty) {
                          //   providerTrue!.txtSearch.text = "Google";
                          // } else {

                          // }

                          if (providerTrue!.txtBookMarkName.text.isEmpty) {
                            providerTrue!.txtBookMarkName.text = 'Google';
                          } else {
                            providerFalse!.bookMarkName(
                              providerFalse!.txtSearch.text,
                            );
                          }

                          providerFalse!.addText(
                            await providerFalse!.inAppWebViewController!
                                .getOriginalUrl(),
                          );
                          // print("${providerTrue!.txtSearch.text}");

                          dialog(context);
                        },
                        icon: Icon(Icons.bookmark_added_sharp),
                      ),
                      IconButton(
                        onPressed: () {
                          providerTrue!.readBookMark();

                          // print(providerFalse!.bookMarks);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BookMarkPage(),
                            ),
                          );
                        },
                        icon: Icon(Icons.more_vert),
                      ),
                    ],
                  ),
                ),
              ),
              (providerTrue!.progress == 1)
                  ? Container()
                  : LinearProgressIndicator(
                      value: providerTrue!.progress,
                    ),
              SizedBox(
                height: 2,
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                child: InAppWebView(
                  initialUrlRequest: URLRequest(
                    url: Uri.parse('https://www.google.com/'),
                  ),
                  onWebViewCreated: (controller) {
                    providerFalse!.inAppWebViewController = controller;
                  },
                  onProgressChanged: (controller, progress) {
                    providerFalse!.changeProgress(progress / 100);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void dialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          title: Column(
            children: [
              TextFormField(
                controller: providerTrue!.txtBookMarkName,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "PLease Enter Name of bookmark";
                  } else {
                    return null;
                  }
                },
                cursorColor: Colors.black,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: 'Enter Book Mark Name',
                  hintStyle: TextStyle(color: Colors.black),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  border: new OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    borderSide: new BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    borderSide: BorderSide(width: 1, color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: providerTrue!.txtBookMarkLink,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "PLease Enter bookmark link";
                  } else {
                    return null;
                  }
                },
                cursorColor: Colors.black,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  border: new OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    borderSide: new BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    borderSide: BorderSide(width: 1, color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
          content: Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height / 14.8,
            width: MediaQuery.of(context).size.width / 14.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: () {
                    // if (providerTrue!.txtBookMarkName.text.isEmpty) {
                    //   print("hello");
                    //   Fluttertoast.showToast(
                    //       msg: "Please Enter book mark name",
                    //       toastLength: Toast.LENGTH_SHORT,
                    //       gravity: ToastGravity.CENTER,
                    //       timeInSecForIosWeb: 1,
                    //       backgroundColor: Colors.red,
                    //       textColor: Colors.white,
                    //       fontSize: 16.0);
                    // }
                    // providerTrue!.save(
                    //     "${providerFalse!.inAppWebViewController!.getOriginalUrl()}");
                    providerTrue!.save(
                      "${providerTrue!.txtBookMarkLink.text}",
                    );

                    providerTrue!
                        .saveBookName("${providerTrue!.txtBookMarkName.text}");

                    bookMarkList(
                        providerTrue!.bookMarks!, providerTrue!.bookmarkName!);

                    print("${providerTrue!.bookmarkName}");
                    providerTrue!.txtBookMarkName.clear();
                    providerTrue!.txtBookMarkLink.clear();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookMarkPage(),
                      ),
                    );
                    // print("${providerTrue!.txtSearch.text}");

                    // if (providerTrue!.formKey.currentState!.validate()) {
                    //   print("${providerTrue!.txtBookMarkName.text}");
                    //   // print("!!!!!!!!!!!!!!!${providerTrue!.name.text}");
                    //   // print("!!!!!!!!!!${providerTrue!.txtName.text}");
                    //   // return
                    //   // providerTrue!.save(
                    //   //     "https://www.google.com/search?q=${providerTrue!.txtSearch.text}");
                    //   // bookMarkList(providerTrue!.bookMarks!);
                    // }
                  },
                  child: Text("Bookmark"),
                ),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    // backgroundColor: Styles.primary,
                    // side: BorderSide(color: Styles.grey, width: 1),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel"),
                ),
                // wsize(),
                // ElevatedButton(
                //   style: ElevatedButton.styleFrom(
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(10.0),
                //     ),
                //     backgroundColor: Styles.primary,
                //     side: BorderSide(color: Styles.grey, width: 1),
                //   ),
                //   onPressed: () {
                //     Navigator.pushNamed(context, '/');
                //   },
                //   child: Text("Go Home"),
                // ),
              ],
            ),
          ),
        );
      },
    );
  }
}
