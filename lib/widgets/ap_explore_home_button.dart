import 'package:flutter/material.dart';

class ApExploreHomeButton extends StatelessWidget {
  const ApExploreHomeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var deviceScreen = MediaQuery.of(context).size;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.yellow,
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
        minimumSize: Size(deviceScreen.width / 1.3, 50),
        elevation: 0.1,
      ),
      onPressed: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => const ConfiguracionScreen(),
        //   ),
        // );
      },
      child: const Text(
        "Sincronizar",
        style: TextStyle(
          color: Colors.black87,
          fontSize: 15,
          fontFamily: "Chirp",
        ),
      ),
    );
  }
}
