import 'package:flutter/material.dart';
import 'package:new_project/core/customButton.dart';
import 'package:new_project/core/styles.dart';

class BMIResultBody extends StatelessWidget {
  const BMIResultBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
              color: Color(0xff7876CD),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0, top: 8, left: 20),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Samy cell', style: Styles.textStyle22),
                                Text(
                                  'A 23 years old male.',
                                  style: Styles.textStyle15,
                                ),
                              ],
                            ),
                            SizedBox(height: 25),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('16.5', style: Styles.textStyle35),
                                Text('BMI', style: Styles.textStyle18),
                              ],
                            ),
                            SizedBox(height: 25),
                            IntrinsicHeight(
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Text('180 cm', style: Styles.textStyle20),
                                      SizedBox(height: 10),
                                      Text('Height', style: Styles.textStyle15),
                                    ],
                                  ),
                                  SizedBox(width: 20),
                                  VerticalDivider(
                                    color: Colors.white,
                                    thickness: 2,
                                    indent: 4,
                                    endIndent: 4,
                                  ),
                                  SizedBox(width: 20),
                                  Column(
                                    children: [
                                      Text('70 kg', style: Styles.textStyle20),
                                      SizedBox(height: 10),
                                      Text('Weight', style: Styles.textStyle15),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        // SizedBox(width: 10),
                        Image.asset(
                          'assets/Images/body.png',
                          width: 177,
                          height:
                              (MediaQuery.sizeOf(context).height * .49) - 150,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 320,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xff01502E),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Under Weight', style: Styles.textStyle22),
                    Text(
                      'Your BMI is less than 18.5',
                      style: Styles.textStyle15,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Lorem ipsum dolor sit amet consectetur. Sagittis interdum dui enim imperdiet sapien cursus velit pharetra. Viverra justo tempor dictum odio. Nisl non dui integer orci nulla eget laoreet tellus. Orci nunc a orci convallis ac orci. Urna auctor at elementum sit ante maecenas ullamcorper rhoncus dictum. Morbi venenatis lectus ultrices euismod. Laoreet purus risus amet enim sagittis ut. Consectetur libero orci urnager dignissi est.',
                      style: Styles.textStyle15,
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20), // or any height you want for spacing

          CustomElevatedButton(
            onpressed: () {
              Navigator.of(context).pop();
            },
            text: 'Calculate BMI Again',
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
