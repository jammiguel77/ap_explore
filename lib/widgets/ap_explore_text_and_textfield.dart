import 'package:ap_explore/widgets/ap_explore_textfield.dart';
import 'package:flutter/material.dart';

class ApExploreTextAndTextField extends StatelessWidget {
  const ApExploreTextAndTextField({Key? key, required this.textName}) : super(key: key);

  final String textName;
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      child: Column(
        children:[
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              textName,
              style: const TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const ApExploreTextField(),
        ],
      ),
    );
  }
}
