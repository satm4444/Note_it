import 'package:flutter/material.dart';
import 'package:note_it/screens/detail_screen.dart';

import 'screens/main_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.green),
      title: 'Note It',
      debugShowCheckedModeBanner: false,
      home: MainPage(),
      routes: {
        DetailScreen.routeName: (ctx) => DetailScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => MainPage());
      },
    );
  }
}
