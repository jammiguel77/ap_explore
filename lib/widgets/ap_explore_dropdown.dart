import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApExploreDropDown extends StatefulWidget {
  const ApExploreDropDown({
    Key? key,
  }) : super(key: key);

  @override
  State<ApExploreDropDown> createState() => _ApExploreDropDownState();
}

class _ApExploreDropDownState extends State<ApExploreDropDown> {
  var dropDownSelection;

  @override
  void initState() {
    super.initState();
    makeDropDownRequest();
  }

  final String url =
      "http://79.143.190.196:8080/jinvmanz/servletwwwSyncData?xAccion=extraeCatalogoMaquinas&xExterno=1&xDatabase=dbexplore2223";

  List data = [];

  Future<String> makeDropDownRequest() async {
    try {
      final response = await http.get(Uri.parse(url));
      final responseBody = json.decode(response.body);

      setState(() {
        data = responseBody;
      });

      return "Success";
    } catch (error) {
      return "Fail";
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: dropDownSelection,
      onChanged: (value) {
        setState(
          () {
            dropDownSelection = value;
          },
        );
      },
      items: data
          .map(
            (item) => DropdownMenuItem(
              child: Text(item["DESCRIPCION"] + "  " + item["NUMERO"]),
              value: item["IID"].toString(),
              enabled: true,
            ),
          )
          .toList(),
    );
  }
}
