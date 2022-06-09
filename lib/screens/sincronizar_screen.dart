import 'package:ap_explore/screens/fetcha_screen.dart';
import 'package:ap_explore/widgets/ap_explore_image.dart';
import 'package:flutter/material.dart';

class SincronizarScreen extends StatelessWidget {
  const SincronizarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var deviceScreen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sincronizar"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const ApExploreImage(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
                minimumSize: Size(deviceScreen.width / 1.3, 50),
                elevation: 0.1,
              ),
              onPressed: () {},
              child: const Text(
                "Obtener Systema",
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.deepOrangeAccent,
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
                minimumSize: Size(deviceScreen.width / 1.3, 50),
                elevation: 0.1,
              ),
              onPressed: () {},
              child: const Text(
                "Obtener Catalogos",
                style: TextStyle(color: Colors.black),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
                minimumSize: Size(deviceScreen.width / 1.3, 50),
                elevation: 0.1,
              ),
              onPressed: () {},
              child: const Text(
                "Enviar Catalogos",
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.yellow,
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                minimumSize: Size(deviceScreen.width / 1.3, 50),
                elevation: 0.1,
              ),
              onPressed: () {},
              child: const Text(
                "Enviar Catalogos",
                style: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(
              height: deviceScreen.height / 5,
            )
          ],
        ),
      ),
    );
  }
}
