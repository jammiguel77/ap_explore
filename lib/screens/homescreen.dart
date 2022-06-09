import 'package:ap_explore/screens/sincronizar_screen.dart';
import 'package:ap_explore/screens/fetcha_screen.dart';
import 'package:ap_explore/widgets/ap_explore_image.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var deviceScreen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu"),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: Center(
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
                  "Configuracion",
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey,
                  textStyle: const TextStyle(fontWeight: FontWeight.bold),
                  minimumSize: Size(deviceScreen.width / 1.3, 50),
                  elevation: 0.1,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FetchaScreen(),
                    ),
                  );
                },
                child: const Text(
                  "Avance Diario",
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.yellow,
                  textStyle: const TextStyle(fontWeight: FontWeight.bold),
                  minimumSize: Size(deviceScreen.width / 1.3, 50),
                  elevation: 0.1,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SincronizarScreen(),
                    ),
                  );
                },
                child: const Text(
                  "Sincronizar",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 15,
                    fontFamily: "Chirp",
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueAccent,
                  textStyle: const TextStyle(fontWeight: FontWeight.bold),
                  minimumSize: Size(deviceScreen.width / 1.3, 50),
                  elevation: 0.1,
                ),
                onPressed: () {},
                child: const Text(
                  "Reportes",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 15,
                    fontFamily: "Chirp",
                  ),
                ),
              ),
              SizedBox(
                height: deviceScreen.height / 5,
              )
            ],
          ),
        ),
      ),
    );
  }
}
