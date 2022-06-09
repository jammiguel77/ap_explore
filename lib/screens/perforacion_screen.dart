// ignore_for_file: unnecessary_const

import 'package:ap_explore/screens/tiempos_horas.dart';
import 'package:ap_explore/widgets/ap_explore_elevated_button.dart';
import 'package:ap_explore/widgets/ap_explore_note_widget.dart';
import 'package:ap_explore/widgets/ap_explore_text_and_textfield.dart';
import 'package:flutter/material.dart';

class PerforacionScreen extends StatelessWidget {
  const PerforacionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Perforacion"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const ApExploreTextAndTextField(
              textName: "Profundidad Inicial:",
            ),
            const ApExploreTextAndTextField(
              textName: "Profundidad Final:",
            ),
            const ApExploreTextAndTextField(
              textName: "Metros Perforados:",
            ),
            const ApExploreTextAndTextField(
              textName: "Metros Recuperados",
            ),
            const ApExploreNoteWiget(textFieldName: "List of Perforacion:"),
            const ApExploreNoteWiget(
              textFieldName: "Notas",
            ),
            ApExploreButton(
              buttonName: "Siguiente",
              onButtonPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TiemposHorasScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
