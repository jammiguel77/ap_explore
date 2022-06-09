import 'package:flutter/material.dart';

class ApExploreNoteWiget extends StatelessWidget {
  const ApExploreNoteWiget({Key? key,  this.textFieldName= "Notas"})
      : super(key: key);
  final String textFieldName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              textFieldName,
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            keyboardType: TextInputType.multiline,
            maxLength: 1000,
            autofocus: false,
            decoration: InputDecoration(
              focusColor: Colors.black,
              contentPadding: const EdgeInsets.symmetric(vertical: 10),
              suffixIconColor: Colors.black87,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: const BorderSide(
                  width: 0.05,
                  style: BorderStyle.none,
                ),
              ),
            ),
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
