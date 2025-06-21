import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/features/BMI_calculations/Presentation/UIscreens/bmi.dart';
import 'package:new_project/features/BMI_calculations/Presentation/UIscreens/splash_view.dart';
import 'package:new_project/features/BMI_calculations/Presentation/controllers/cubit/clac_bmi_cubit.dart';

import 'core/styles.dart';
import 'features/BMI_calculations/Presentation/UIscreens/bmi_details.dart';
import 'features/BMI_calculations/Presentation/UIscreens/home_page.dart';

void main() {
  runApp(const FLutterApp());
}

class FLutterApp extends StatelessWidget {
  const FLutterApp({super.key});

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BmiCubit(),
      child: MaterialApp(
        initialRoute: '/splash',
        theme: ThemeData(primaryColor: Styles.primaryColor),
        debugShowCheckedModeBanner: false,
        routes: {
          '/splash':(context)=>SplashScreen(),
          '/home': (context) => HomePage(),
          '/bmi': (context) => BMIPage(),
          '/bmi_result': (context) => BmiResult(),
        },
      ),
    );
  }
}
 
