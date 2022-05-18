import 'package:ap_explore/database/database_helper.dart';
import 'package:flutter/material.dart';

class TestFeature extends StatelessWidget {
  const TestFeature({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          child: Text("Test db"),
          onPressed: () {
            print("object");
          },
        ),
      ),
    );
  }
}
