import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/customButton.dart';
import '../../../../core/styles.dart';
import '../controllers/cubit/clac_bmi_cubit.dart';

class BMIResultBody extends StatelessWidget {
  const BMIResultBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BmiCubit, ClacBmiState>(
      builder: (context, state) {
        // Get the cubit
        final bmiCubit = BlocProvider.of<BmiCubit>(context);

        if (state is Bmiloaded) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is Bmifailed) {
          return Center(child: Text('Failed: ${state.errmessage}'));
        } else if (bmiCubit.bmiModel == null) {
          return const Center(child: Text('No data available yet'));
        } else {
          // Getting data from cubit
          final bmiModel = bmiCubit.bmiModel!;

          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                // Top Info Box
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    color: const Color(0xff7C83AD),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 16.0,
                      top: 8,
                      left: 20,
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                bmiCubit.name.toString(),
                                style: Styles.textStyle22,
                              ),
                              Text(
                                bmiCubit.age.toString(),
                                style: Styles.textStyle15,
                              ),
                              const SizedBox(height: 25),
                              Text(
                                bmiModel.data!.bmi.roundToDouble().toString(),
                                style: Styles.textStyle35,
                              ),
                              const Text('BMI', style: Styles.textStyle18),
                              const SizedBox(height: 25),
                              IntrinsicHeight(
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          BlocProvider.of<BmiCubit>(
                                            context,
                                          ).bmiModel!.data!.height.toString(),
                                          style: Styles.textStyle20,
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          'Height',
                                          style: Styles.textStyle15,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(width: 20),
                                    const VerticalDivider(
                                      color: Colors.white,
                                      thickness: 2,
                                      indent: 4,
                                      endIndent: 4,
                                    ),
                                    const SizedBox(width: 20),
                                    Column(
                                      children: [
                                        Text(
                                          BlocProvider.of<BmiCubit>(
                                            context,
                                          ).bmiModel!.data!.weight.toString(),
                                          style: Styles.textStyle20,
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          'Weight',
                                          style: Styles.textStyle15,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 10),
                          Image.asset(
                            'assets/Images/body.png',
                            width: 177,
                            height:
                                (MediaQuery.sizeOf(context).height * .49) - 150,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Summary Box
                Container(
                  height: 320,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xffBFA9BA),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // const Text('Under Weight', style: Styles.textStyle22),
                          Text(
                            BlocProvider.of<BmiCubit>(
                              context,
                            ).bmiModel!.data!.summary,
                            style: Styles.textStyle15,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            BlocProvider.of<BmiCubit>(
                              context,
                            ).bmiModel!.data!.recommendation,
                            style: Styles.textStyle15,
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Button
                CustomElevatedButton(
                  onpressed: () {
                    Navigator.of(context).pop();
                  },
                  text: 'Calculate BMI Again',
                ),
                const SizedBox(height: 15),
              ],
            ),
          );
        }
      },
    );
  }
}
