
import 'package:flutter/material.dart';
import 'package:new_project/core/customButton.dart';
import 'package:new_project/core/styles.dart';
import 'package:new_project/features/BMI_calculations/Presentation/UIscreens/bmi.dart';

class CustomContainerHome extends StatelessWidget {
  const CustomContainerHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * .6,
      decoration: BoxDecoration(
        color: Color(0xff7c83AD),
        borderRadius: BorderRadius.circular(25),
      ),
    
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Text('Know Your Body Better , ', style: Styles.textStyle24),
            Text(
              'Get Your BMI Score in Less',
              style: Styles.textStyle24,
            ),
            Text('Than a Minute', style: Styles.textStyle24),
            SizedBox(height: 16),
    
            Text(
              'It takes just 30 seconds - and your health is',
              style: Styles.textStyle14,
            ),
            Text('worth it!', style: Styles.textStyle14),
    
            SizedBox(height: 8),
            Divider(
              color: Colors.white,
              thickness: 1,
              indent: 8,
              endIndent: 8,
            ),
    
            // SizedBox(height: 15),
            CustomElevatedButton(
              onpressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return BMIPage();
                    },
                  ),
                );
              },
              text: 'Get Start',
            ),
          ],
        ),
      ),
    );
  }
}
