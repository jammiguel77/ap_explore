import 'package:flutter/material.dart';

class ApExploreImage extends StatelessWidget {
  const ApExploreImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Image(
      height: 100,
      image: AssetImage(
        "images/ap_explore_image.jpg",
      ),
    );
  }
}
