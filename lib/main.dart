import 'package:flutter/material.dart';
import 'package:new_project/features/HomePage/Presentation/Views/bmi.dart';

import 'core/styles.dart';
import 'features/HomePage/Presentation/Views/bmi_result.dart';
import 'features/HomePage/Presentation/Views/home_page.dart';

void main() {
  runApp(const FLutterApp());
}

class FLutterApp extends StatelessWidget {
  const FLutterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      theme: ThemeData(primaryColor: Styles.primaryColor),
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) => HomePage(),

        '/bmi': (context) => BMIPage(),
        '/bmi_result': (context) => BmiResult(),
      },
    );
  }
}
