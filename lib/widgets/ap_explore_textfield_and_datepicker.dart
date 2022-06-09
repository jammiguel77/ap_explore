import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ApExploreTextFieldAndDatePicker extends StatefulWidget {
  const ApExploreTextFieldAndDatePicker({Key? key, required this.textName})
      : super(key: key);
  final String textName;
  @override
  State<ApExploreTextFieldAndDatePicker> createState() =>
      _ApExploreTextFieldAndDatePickerState();
}

class _ApExploreTextFieldAndDatePickerState
    extends State<ApExploreTextFieldAndDatePicker> {
  DateTime? _dateTime;
  final dateFormat = DateFormat.yMMMd();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                widget.textName,
                style: const TextStyle(fontSize: 20),
              ),
              GestureDetector(
                onTap: () => editDate(context),
                child: Text(
                  _dateTime == null
                      ? dateFormat.format(DateTime.now())
                      : dateFormat.format(_dateTime!),
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              IconButton(
                  onPressed: () {
                    editDate(context);
                  },
                  icon: const Icon(
                    Icons.edit,
                  )),
            ],
          )
        ],
      ),
    );
  }

  void editDate(BuildContext context) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2021),
            lastDate: DateTime(2050))
        .then((date) {
      setState(() {
        _dateTime = DateUtils.dateOnly(
          date!,
        );
      });
    });
  }
}
