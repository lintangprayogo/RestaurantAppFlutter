import 'package:flutter/material.dart';
import 'package:restaurantappflutter/ui/pages/pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BasicPage(
        backButtonFunction: () {},
        child: Text("BODY"),
      ),
    );
  }
}
