import 'package:demo29/screens/application/provider/applicationProvider.dart';
import 'package:demo29/screens/application/view/applicationPage.dart';
import 'package:demo29/screens/home/provider/homeProvider.dart';
import 'package:demo29/screens/home/view/homePage.dart';
import 'package:demo29/screens/search/provider/searchProvider.dart';
import 'package:demo29/screens/search/views/searchPage.dart';
import 'package:demo29/screens/splash/view/splashPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/applicationSearch/provider/applicationSearchProvider.dart';
import 'screens/bookmark/provider/bookmarkProvider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SearchProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ApplicationProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ApplicationSearchProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => BookMarkProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashPage(),
      ),
    ),
  );
}
