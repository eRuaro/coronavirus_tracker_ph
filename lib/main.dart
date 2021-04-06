import 'package:flutter/material.dart';

void main() {
  runApp(CovidTracker());
}

class CovidTracker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),

    );
  }
}
