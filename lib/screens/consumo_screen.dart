import 'package:ap_explore/screens/material_usado_screen.dart';
import 'package:ap_explore/widgets/ap_explore_elevated_button.dart';
import 'package:ap_explore/widgets/ap_explore_note_widget.dart';
import 'package:ap_explore/widgets/ap_explore_text_and_textfield.dart';
import 'package:flutter/material.dart';

class ConsumoScreen extends StatelessWidget {
  const ConsumoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Consumo"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const ApExploreTextAndTextField(textName: "Cajas de Núcleo:"),
              const ApExploreTextAndTextField(textName: "Diésel Maquina:"),
              const ApExploreTextAndTextField(textName: "Diésel Bomba Propia:"),
              const ApExploreTextAndTextField(textName: "Gasolina Motobomba:"),
              const ApExploreTextAndTextField(textName: "MUDVIS:"),
              const ApExploreTextAndTextField(textName: "GRASA TUBOS:"),
              const ApExploreTextAndTextField(textName: "DTH300:"),
              const ApExploreTextAndTextField(textName: "15W40:"),
              const ApExploreTextAndTextField(textName: "80W90::"),
              const ApExploreTextAndTextField(textName: "BENTONITA:"),
              const ApExploreTextAndTextField(textName: "EP2::"),
              const ApExploreNoteWiget(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ApExploreButton(
                    buttonName: "Atras",
                    onButtonPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  ApExploreButton(
                    buttonName: "Siguiente",
                    onButtonPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MaterialUsado(),
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
        ));
  }
}
