import 'package:flutter/material.dart';

class ApExploreTextField extends StatelessWidget {
  const ApExploreTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: false,
      decoration: InputDecoration(
        focusColor: Colors.black,
        contentPadding: const EdgeInsets.all(15.0),
        suffixIconColor: Colors.black87,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(
            width: 0.05,
            style: BorderStyle.none,
          ),
        ),
      ),
      style: const TextStyle(
        color: Colors.black,
      ),
    );
  }
}
