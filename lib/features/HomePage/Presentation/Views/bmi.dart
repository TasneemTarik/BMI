import 'package:flutter/material.dart';
import 'package:new_project/core/customButton.dart';
import 'package:new_project/core/custom_container.dart';
import 'package:new_project/core/custom_text_field.dart';
import 'package:new_project/core/styles.dart';
import 'package:new_project/features/HomePage/Presentation/Views/bmi_result.dart';
import 'package:new_project/features/HomePage/Presentation/Widgets/image_container.dart';

class BMIPage extends StatefulWidget {
  const BMIPage({super.key});

  @override
  State<BMIPage> createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {
  String? genderSelection = '';
  int number = 0; // Initial number
  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController datecontroller = TextEditingController();

  void _decreaseHeight() {
    setState(() {
      int current = int.tryParse(controller.text) ?? 0;
      if (current > 0) {
        current--;
      }
      controller.text = current.toString();
    });
  }

  void _decreaseWeight() {
    setState(() {
      int current1 = int.tryParse(controller2.text) ?? 0;
      if (current1 > 0) {
        current1--;
      }
      controller2.text = current1.toString();
    });
  }

  void _increaseHeight() {
    setState(() {
      int current = int.tryParse(controller.text) ?? 0;
      current++;
      controller.text = current.toString();
    });
  }

  void _increaseWeight() {
    setState(() {
      int current1 = int.tryParse(controller2.text) ?? 0;
      current1++;
      controller2.text = current1.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    TextInputType? keyboardtypename = TextInputType.name;
    TextInputType? keyboardtypedate = TextInputType.datetime;

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      backgroundColor: Styles.primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text('BMI', style: Styles.textStyle40)],
              ),
              SizedBox(height: 50),
              Text('Name ', style: Styles.textStyle16),
              SizedBox(height: 8),
              CustomTextField(
                controller: namecontroller,
                keyboardType: keyboardtypename,
              ),
              SizedBox(height: 8),

              Text('Birth Date ', style: Styles.textStyle16),
              SizedBox(height: 8),
              CustomTextField(
                controller: datecontroller,
                keyboardType: keyboardtypedate,
              ),
              SizedBox(height: 8),
              Text('Choose Gender', style: Styles.textStyle16),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        child: ImageContainer(
                          imagepath: 'assets/Images/male.png',
                          color: genderSelection == 'male'
                              ? Color(0xFF4A4A6A)
                              : Colors.transparent,
                        ),
                        onTap: () {
                          setState(() {
                            genderSelection = 'male';
                          });
                        },
                      ),
                      // Image.asset(
                      //   'assets/Images/male.png',
                      //   // width: 100,
                      //   // height: 100,
                      // ),
                      Text('Male', style: Styles.textStyle16),
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        child: ImageContainer(
                          imagepath: 'assets/Images/female.png',
                          color: genderSelection == 'female'
                              ? Color(0xFF4A4A6A)
                              : Colors.transparent,
                        ),
                        onTap: () {
                          setState(() {
                            genderSelection = 'female';
                          });
                        },
                      ),
                      Text('Female', style: Styles.textStyle16),
                    ],
                  ),
                ],
              ),
              // Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: []),
              // CustomTextField(),
              SizedBox(height: 8),
              Text('Your Height(cm)', style: Styles.textStyle16),

              CustomContainer(
                onpressedminus: _decreaseHeight,
                controller: controller,
                onpressedplus: _increaseHeight,
              ),
              SizedBox(height: 8),
              Text('Your Weight(kg)', style: Styles.textStyle16),
              CustomContainer(
                onpressedminus: _decreaseWeight,
                controller: controller2,
                onpressedplus: _increaseWeight,
              ),

              CustomElevatedButton(
                onpressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return BmiResult();
                      },
                    ),
                  );
                },
                text: 'Calculate BMI',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
