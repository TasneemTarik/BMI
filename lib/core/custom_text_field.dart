import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({super.key,required this.controller,required this.keyboardType});
  TextEditingController? controller = TextEditingController();
  TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(keyboardType: keyboardType,
      controller: controller,
      textAlign: TextAlign.justify,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        filled: true,
        // focusColor: Color.fromARGB(15, 179, 178, 234),
        fillColor: Color.fromARGB(15, 179, 178, 234),
      ),
    );
  }
}
