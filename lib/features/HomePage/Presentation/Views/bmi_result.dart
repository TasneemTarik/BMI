import 'package:flutter/material.dart';

import '../Widgets/bmi_result_body.dart';

class BmiResult extends StatelessWidget {
  const BmiResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI result')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: BMIResultBody(),
      ),
    );
  }
}
