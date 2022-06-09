import 'dart:convert';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApExploreDropDownSearch extends StatefulWidget {
  final String dropDownUrl;
  final String dropDownTitle;
  const ApExploreDropDownSearch(
      {Key? key, required this.dropDownUrl, required this.dropDownTitle})
      : super(key: key);

  @override
  State<ApExploreDropDownSearch> createState() =>
      _ApExploreDropDownSearchState();
}

class _ApExploreDropDownSearchState extends State<ApExploreDropDownSearch> {
  var dropDownSelection;

  @override
  void initState() {
    super.initState();
    makeDropDownRequest();
  }

  List data = [];

  Future<bool> makeDropDownRequest() async {
    try {
      final response = await http.get(Uri.parse(widget.dropDownUrl));
      final responseBody = json.decode(response.body);

      setState(() {
        data = responseBody;
      });

      return true;
    } catch (error) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownSearch(
      mode: Mode.MENU,
      showSelectedItems: false,
      items: data.map((item) => item).toList(),
      dropdownBuilder: _customDropDown,
      popupItemBuilder: _customPopupItemBuilder,

      dropdownSearchDecoration: InputDecoration(
          labelText: widget.dropDownTitle,
          labelStyle: const TextStyle(color: Colors.black)),
      onChanged: itemSelectionChanged,
      showSearchBox: true,
      // compareFn: null,
      selectedItem: dropDownSelection,
    );
  }

  Widget _customDropDown(BuildContext context, item) {
    if (item == null) {
      return const Text("Please select an item");
    }
    return DropdownMenuItem(
      child: Text(item["DESCRIPCION"] + "  " + item["NUMERO"]),
      value: item["IID"].toString(),
      enabled: true,
    );
  }

  Widget _customPopupItemBuilder(BuildContext context, item, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: DropdownMenuItem(
        child: Text(item["DESCRIPCION"] + "  " + item["NUMERO"]),
        value: item["IID"].toString(),
        enabled: true,
      ),
    );
  }

  void itemSelectionChanged(value) {
    setState(() {
      dropDownSelection = value;
    });
  }
}
