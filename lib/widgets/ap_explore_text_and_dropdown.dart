import 'package:ap_explore/widgets/ap_explore_dropdown.dart';
import 'package:flutter/material.dart';

class ApExploreTextAndDropDown extends StatelessWidget {
  const ApExploreTextAndDropDown(
      {Key? key, required this.textName, required this.dropDownItems})
      : super(key: key);
  final List<String> dropDownItems;
  final String textName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
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
          const ApExploreDropDown(),
        ],
      ),
    );
  }
}
