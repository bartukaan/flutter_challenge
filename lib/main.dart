import 'package:flutter/material.dart';
import 'package:flutter_challenge/screens/home_screen.dart';
import 'package:flutter_challenge/view_models/feed_view_model.dart';
import 'package:provider/provider.dart';

import 'locator.dart';
import 'screens/home_screen.dart';
import 'view_models/feed_view_model.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Challenge',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider<FeedViewModel>(
         create: (context) => getIt<FeedViewModel>(), child: HomeScreen(pageNumber: 1,)),
         // create: (context) => FeedViewModel(), child: HomeScreen()),
    );
  }
}
