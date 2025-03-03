import 'package:flutter/material.dart';

import 'listview_item.dart';

final List advicesImage = [
  "assets/images/stop smoking.png",
  "assets/images/radon.png",
  "assets/images/carcinogens.png",
  "assets/images/diet.png",
  "assets/images/training.png",
];
final List advicesDesc = [
  "Stop smoking.",
  "Test your home for radon.",
  "Avoid carcinogens at work.",
  "Eat a diet full of fruits and vegetables.",
  "Exercise most days of the week.",
];

Widget advicesTab() => Center(
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: advicesImage.length,
                itemBuilder: (context, index) {
                  return ListViewItem(
                      image: advicesImage[index], text: advicesDesc[index]);
                }),
          ),
        ],
      ),
    );
