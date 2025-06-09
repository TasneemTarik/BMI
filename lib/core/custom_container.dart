import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  CustomContainer({
    super.key,
    this.onpressedminus,
    this.onpressedplus,
    required this.controller,
  });
  void Function()? onpressedminus;
  void Function()? onpressedplus;
  TextEditingController controller = TextEditingController();

  // String text;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: IconButton(
          onPressed: onpressedminus,
          icon: Icon(Icons.remove, color: Color(0xFF4A4A6A)),
        ),
        suffixIcon: IconButton(
          onPressed: onpressedplus,
          icon: Icon(Icons.add, color: Color(0xFF4A4A6A)),
        ),
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
      keyboardType: TextInputType.number,
      controller: controller,
    );
  }
}
