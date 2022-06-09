import 'package:ap_explore/widgets/ap_explore_elevated_button.dart';
import 'package:ap_explore/widgets/ap_explore_note_widget.dart';
import 'package:ap_explore/widgets/ap_explore_text_and_dropdown.dart';
import 'package:ap_explore/widgets/ap_explore_text_and_textfield.dart';
import 'package:flutter/material.dart';

class MaterialUsado extends StatelessWidget {
  const MaterialUsado({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Material Usado"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const ApExploreTextAndDropDown(textName: "Material:", dropDownItems: [],),
            const ApExploreTextAndTextField(textName: "Cantidad:"),
            const ApExploreNoteWiget(
              textFieldName: "List of Perforación:",
            ),
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
                  buttonName: "Grabar",
                  onButtonPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
