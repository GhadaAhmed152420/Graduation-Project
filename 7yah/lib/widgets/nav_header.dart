import 'package:flutter/material.dart';

Widget navHeader() {
  return Row(
    children: [
      const CircleAvatar(
        radius: 40,
        backgroundImage: NetworkImage('https://picsum.photos/200'),
      ),
      const SizedBox(
        width: 20.0,
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Ghada Ahmed',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'ghadaahmed@gmail.com',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 14,
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
