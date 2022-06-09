import 'package:ap_explore/screens/consumo_screen.dart';
import 'package:ap_explore/widgets/ap_explore_elevated_button.dart';
import 'package:ap_explore/widgets/ap_explore_note_widget.dart';
import 'package:ap_explore/widgets/ap_explore_text_and_textfield.dart';
import 'package:flutter/material.dart';

class TiemposHorasScreen extends StatelessWidget {
  const TiemposHorasScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tiempos / Horas"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const ApExploreTextAndTextField(
              textName: "Stand By:",
            ),
            const ApExploreTextAndTextField(
              textName: "Traslado/Inst:",
            ),
            const ApExploreTextAndTextField(
              textName: "Perforación:",
            ),
            const ApExploreTextAndTextField(
              textName: "Estabilizado y Rimado:",
            ),
            const ApExploreTextAndTextField(
              textName: "Reperforado:",
            ),
            const ApExploreTextAndTextField(
              textName: "Casing:",
            ),
            const ApExploreTextAndTextField(
              textName: "Sacando Tubería:",
            ),
            const ApExploreTextAndTextField(
              textName: "Bajando Tubería:",
            ),
            const ApExploreTextAndTextField(
              textName: "Medicion Reflex:",
            ),
            const ApExploreTextAndTextField(
              textName: "Mantenimiento:",
            ),
            const ApExploreTextAndTextField(
              textName: "Comida:",
            ),
            const ApExploreTextAndTextField(
              textName: "Otros:",
            ),
            const ApExploreTextAndTextField(
              textName: "Sumatoria:",
            ),
            const ApExploreNoteWiget(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ApExploreButton(
                  buttonName: "Atras",
                  onButtonPressed: () {
                    Navigator.pop(
                      context,
                    );
                  },
                ),
                ApExploreButton(
                  buttonName: "Siguiente",
                  onButtonPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ConsumoScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
