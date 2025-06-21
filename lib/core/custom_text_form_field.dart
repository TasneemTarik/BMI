import 'package:flutter/material.dart';

class weightorheight_text_field extends StatelessWidget {
  weightorheight_text_field({
    super.key,
    this.onpressedminus,
    this.onpressedplus,
    required this.controller,
    required this.validate,
  });
  void Function()? onpressedminus;
  void Function()? onpressedplus;
  String? Function(String?)? validate;
  TextEditingController controller = TextEditingController();

  // String text;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validate,
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
