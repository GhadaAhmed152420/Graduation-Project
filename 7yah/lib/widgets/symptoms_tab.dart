import 'package:flutter/material.dart';

import 'listview_item.dart';

final List symptomsImage = [
  "assets/images/coughing.png",
  "assets/images/breath.png",
  "assets/images/coughingUpBlood.png",
  "assets/images/Wheezing.png",
  "assets/images/tired.png",
  "assets/images/headache.png",
  "assets/images/thin.png",
];
final List symptomsDesc = [
  "Coughing that gets worse or doesn't go away.",
  "Shortness of breath.",
  "Coughing up blood.",
  "Wheezing.",
  "Feeling very tired all the time.",
  "Headache.",
  "Weight loss with no known cause.",
];

Widget symptomsTab() => Center(
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: symptomsImage.length,
                itemBuilder: (context, index) {
                  return ListViewItem(
                      image: symptomsImage[index], text: symptomsDesc[index]);
                }),
          ),
        ],
      ),
    );
