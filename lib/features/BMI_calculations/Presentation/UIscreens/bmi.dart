import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/core/customButton.dart';
import 'package:new_project/core/custom_text_form_field.dart';
import 'package:new_project/core/custom_text_field.dart';
import 'package:new_project/core/styles.dart';
import 'package:new_project/features/BMI_calculations/Data/Models/bmi_model.dart';
import 'package:new_project/features/BMI_calculations/Presentation/UIscreens/bmi_details.dart';
import 'package:new_project/features/BMI_calculations/Presentation/Widgets/image_container.dart';
import 'package:new_project/features/BMI_calculations/Presentation/controllers/cubit/clac_bmi_cubit.dart';

class BMIPage extends StatefulWidget {
  const BMIPage({super.key});

  @override
  State<BMIPage> createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {
  String? genderSelection = '';
  int number = 0; // Initial number
  TextEditingController weight = TextEditingController();
  TextEditingController height = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController agecontroller = TextEditingController();

  void _decreaseHeight() {
    setState(() {
      int current = int.tryParse(weight.text) ?? 0;
      if (current > 0) {
        current--;
      }
      weight.text = current.toString();
    });
  }

  void _decreaseWeight() {
    setState(() {
      int current1 = int.tryParse(height.text) ?? 0;
      if (current1 > 0) {
        current1--;
      }
      height.text = current1.toString();
    });
  }

  void _increaseHeight() {
    setState(() {
      int current = int.tryParse(weight.text) ?? 0;
      current++;
      weight.text = current.toString();
    });
  }

  void _increaseWeight() {
    setState(() {
      int current1 = int.tryParse(height.text) ?? 0;
      current1++;
      height.text = current1.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    TextInputType? keyboardtypename = TextInputType.name;
    TextInputType? keyboardtypeage = TextInputType.number;
    final _formkey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      backgroundColor: Styles.primaryColor,
      body: BlocBuilder<BmiCubit, ClacBmiState>(
        builder: (context, state) {
          if (state is Bmiloaded) {
            return CircularProgressIndicator();
          } else if (state is Bmifailed) {
            return Center(
              child: Text(
                'Failed to load BMI result',
                style: Styles.textStyle15,
              ),
            );
            // return ScaffoldMessenger(
            //   child: SnackBar(content: Text('somthing wrong')),
            // );
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Form(
                  key: _formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text('BMI', style: Styles.textStyle40)],
                      ),
                      SizedBox(height: 35),
                      Text('Name ', style: Styles.textStyle16),
                      SizedBox(height: 8),
                      CustomTextField(
                        validate: (p0) {
                          if (p0 == null || p0.isEmpty) {
                            return 'please enter your name';
                          } else {
                            BlocProvider.of<BmiCubit>(context).name = p0;

                            return null;
                          }
                        },

                        controller: namecontroller,
                        keyboardType: keyboardtypename,
                      ),
                      SizedBox(height: 8),

                      Text('Age', style: Styles.textStyle16),
                      SizedBox(height: 8),
                      CustomTextField(
                        validate: (p0) {
                          if (p0 == null || p0.isEmpty) {
                            return 'please enter your age';
                          } else {
                            BlocProvider.of<BmiCubit>(context).age =
                                int.tryParse(p0);
                            return null;
                          }
                        },

                        // submitted: (p0) =>
                        controller: agecontroller,
                        keyboardType: keyboardtypeage,
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
                                      ? Color(0xFF182346)
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
                                      ? Color(0xFF182346)
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

                      SizedBox(height: 8),
                      Text('Your Height(cm)', style: Styles.textStyle16),

                      weightorheight_text_field(
                        validate: (input) {
                          if (input != null && input.isNotEmpty) {
                            return null;
                          } else {
                            return 'please enter your height';
                          }
                        },
                        onpressedminus: _decreaseHeight,
                        controller: height,
                        onpressedplus: _increaseHeight,
                      ),
                      SizedBox(height: 8),
                      Text('Your Weight(kg)', style: Styles.textStyle16),
                      weightorheight_text_field(
                        validate: (input) {
                          if (input != null && input.isNotEmpty) {
                            return null;
                          } else {
                            return 'please enter your weight';
                          }
                        },
                        onpressedminus: _decreaseWeight,
                        controller: weight,
                        onpressedplus: _increaseWeight,
                      ),

                      CustomElevatedButton(
                        onpressed: () {
                          if (_formkey.currentState!.validate()) {
                            BlocProvider.of<BmiCubit>(context).fetchbmi(
                              double.parse(weight.text),
                              double.parse(height.text),
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return BmiResult();
                                },
                              ),
                            );
                          }
                        },
                        text: 'Calculate BMI',
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
