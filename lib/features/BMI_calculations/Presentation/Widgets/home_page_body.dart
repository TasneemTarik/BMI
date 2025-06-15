
import 'package:flutter/material.dart';

import 'custom_container_home.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Image.asset('assets/Images/Illustration.png',width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height*.5,)
        SizedBox(height: 140),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Image.asset(
            'assets/Images/Illustration.png',
            // width: MediaQuery.of(context).size.width * .8,
            height: MediaQuery.of(context).size.height * .4,
          ),
        ),
        CustomContainerHome(),
      ],
    );
  }
}
