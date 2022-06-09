import 'package:ap_explore/constants/ursl.dart';
import 'package:ap_explore/screens/perforacion_screen.dart';
import 'package:ap_explore/widgets/ap_explore_dropdown_search.dart';
import 'package:ap_explore/widgets/ap_explore_elevated_button.dart';
import 'package:ap_explore/widgets/ap_explore_note_widget.dart';
import 'package:ap_explore/widgets/ap_explore_text_and_dropdown.dart';
import 'package:ap_explore/widgets/ap_explore_text_and_textfield.dart';
import 'package:ap_explore/widgets/ap_explore_textfield_and_datepicker.dart';
import 'package:ap_explore/constants/globals.dart';
import 'package:flutter/material.dart';

class FetchaScreen extends StatefulWidget {
  const FetchaScreen({Key? key}) : super(key: key);

  @override
  State<FetchaScreen> createState() => _FetchaScreenState();
}

class _FetchaScreenState extends State<FetchaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fetch Data"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const ApExploreTextFieldAndDatePicker(
              textName: "Fecha:",
            ),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: ApExploreDropDownSearch(
                dropDownUrl: maquinaUrl,
                dropDownTitle: "Maquina",
              ),
            ),
            const ApExploreTextAndTextField(
              textName: "Barreno",
            ),
            const ApExploreTextAndTextField(
              textName: "Inclinacion",
            ),
            const ApExploreTextAndDropDown(
              textName: "Diametro:",
              dropDownItems: [],
            ),
            const ApExploreTextAndDropDown(
              textName: "Turno:",
              dropDownItems: [],
            ),
            const ApExploreTextAndDropDown(
              textName: "Perforista:",
              dropDownItems: [],
            ),
            const ApExploreTextAndDropDown(
              textName: "Ayudante1:",
              dropDownItems: [],
            ),
            const ApExploreTextAndDropDown(
              textName: "Ayudante2:",
              dropDownItems: [],
            ),
            const ApExploreNoteWiget(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                        builder: (context) => const PerforacionScreen(),
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

  void displaySnackBar(text) {
    SnackBar snackBar = SnackBar(
      content: Text(text),
    );
    scaffoldKey.currentState?.showSnackBar(snackBar);
  }
}
