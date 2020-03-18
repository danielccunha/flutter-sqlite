import 'package:flutter/material.dart';
import 'package:flutter_sqlite/views/home_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter SQLite',
      theme: ThemeData(primarySwatch: Colors.red),
      home: HomeView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
