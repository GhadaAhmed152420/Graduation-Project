import 'package:flutter/material.dart';

import '../models/boarding_model.dart';

Widget onBoardingItem(OnBoardingModel model) => Column(
      children: [
        Image.asset(model.image),
        const SizedBox(
          height: 30.0,
        ),
        Text(
          model.title,
          style: const TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          model.body,
          style: const TextStyle(
            fontSize: 16.0,
          ),
        ),
      ],
    );
