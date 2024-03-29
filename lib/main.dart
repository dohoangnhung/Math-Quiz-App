import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:math_quiz/navigator.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'RobotoSlab'),
      home: const NavigatorPage(),
    );
  }
}
