import 'package:flutter/material.dart';
import 'package:learn_fl_22_cloud_firestore/pages/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
