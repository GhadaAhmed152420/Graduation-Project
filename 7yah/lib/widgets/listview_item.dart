import 'package:flutter/material.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem({Key? key, required this.image, required this.text}) : super(key: key);

  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Image.asset(image,width: 200, height: 200,),
        const SizedBox(
          height: 20,
        ),
        Text(text),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
