
import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
 ImageContainer({super.key, required this.imagepath, required this.color});
  String imagepath;
  var color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(color: color, width: 3),
        borderRadius: BorderRadius.circular(10),
      ),

      child: Image.asset(imagepath, fit: BoxFit.cover),
    );
  }
}