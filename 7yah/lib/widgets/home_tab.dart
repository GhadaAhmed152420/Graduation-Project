import 'package:flutter/material.dart';

Widget homeTab() => Center(
  child: Column(
    children: [
      const SizedBox(height: 10.0,),
      Image.asset('assets/images/cancer.png',
      height: 170,
      width: 170,),
      const SizedBox(height: 10.0,),
      const Text(
        'Lung Cancer',
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      Container(
        padding: const EdgeInsets.all(20.0),
        child: const Text(
          'Lung cancer is a type of cancer that begins in the lungs. Your lungs are two spongy organs in your chest that pull in oxygen when you inhale and release carbon dioxide when you exhale. Lung cancer is the leading cause of cancer deaths worldwide.People who smoke are more likely to develop lung cancer, although lung cancer can also occur in people who have never smoked. The risk of lung cancer increases with the length of time you smoke and the number of cigarettes you smoke. If you quit smoking, even after smoking for many years, you can significantly reduce your chances of developing lung cancer.',
          style: TextStyle(
            fontSize: 13,
          ),
        ),
      ),

    ],
  ),
);