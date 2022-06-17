import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:netflix/pages/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Netflix',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MainScreen());
  }
}
