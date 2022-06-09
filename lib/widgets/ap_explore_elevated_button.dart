import 'package:flutter/material.dart';

class ApExploreButton extends StatelessWidget {
  const ApExploreButton(
      {Key? key, required this.buttonName, required this.onButtonPressed})
      : super(key: key);
  final String buttonName;
  final VoidCallback onButtonPressed;

  @override
  Widget build(BuildContext context) {
    var deviceScreen = MediaQuery.of(context).size;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
        minimumSize: Size(deviceScreen.width / 2.5, 50),
        elevation: 0.1,
      ),
      onPressed: () {
        onButtonPressed();
      },
      child: Text(
        buttonName,
        style: const TextStyle(
          color: Colors.black87,
          fontSize: 15,
        ),
      ),
    );
  }
}
