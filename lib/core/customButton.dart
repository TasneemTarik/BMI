import 'package:flutter/material.dart';
import 'package:new_project/core/styles.dart';

class CustomElevatedButton extends StatelessWidget {
  CustomElevatedButton({
    super.key,
    required this.onpressed,
    required this.text,
  });

  void Function()? onpressed;
  String? text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: Size(double.maxFinite, 40),
          backgroundColor: Color(0xff182346),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(10),
          ),
        ),
        onPressed: onpressed,
        child: Text(text ?? 'Click here', style: Styles.textStyle18),
      ),
    );
  }
}
