// ignore_for_file: prefer_const_constructors, unused_import, use_key_in_widget_constructors

import 'package:fergie_time/pages/home.dart';
import 'package:fergie_time/pages/trial.dart';
import 'package:fergie_time/pages/trial_lineup.dart';
import 'package:flutter/material.dart';
import 'package:fergie_time/pages/detail_match.dart';
import 'dart:async';

void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       color: Colors.white,
//       theme: ThemeData(
//         primarySwatch: Colors.orange,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Trial();
//     // return TrialLineup();
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/matches': (context) => DetailMatch(),
      },
    );
  }
}
