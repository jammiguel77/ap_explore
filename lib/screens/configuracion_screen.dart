import 'package:ap_explore/screens/fetch_data_screen.dart';
import 'package:ap_explore/widgets/ap_explore_image.dart';
import 'package:flutter/material.dart';

class ConfiguracionScreen extends StatelessWidget {
  const ConfiguracionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var deviceScreen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Configuracion"),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const ApExploreImage(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      textStyle: const TextStyle(fontWeight: FontWeight.bold),
                      minimumSize: Size(deviceScreen.width / 4, 50),
                      elevation: 0.1,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FetchDataScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "Cusi",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.yellow,
                      textStyle: const TextStyle(fontWeight: FontWeight.bold),
                      minimumSize: Size(deviceScreen.width / 4, 50),
                      elevation: 0.1,
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Bolivar",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      textStyle: const TextStyle(fontWeight: FontWeight.bold),
                      minimumSize: Size(deviceScreen.width / 4, 50),
                      elevation: 0.1,
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Gatos",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: deviceScreen.height / 2,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
