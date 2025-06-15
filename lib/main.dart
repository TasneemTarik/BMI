import 'package:flutter/material.dart';
import 'package:new_project/features/BMI_calculations/Presentation/UIscreens/bmi.dart';

import 'core/styles.dart';
import 'features/BMI_calculations/Presentation/UIscreens/bmi_result.dart';
import 'features/BMI_calculations/Presentation/UIscreens/home_page.dart';

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
