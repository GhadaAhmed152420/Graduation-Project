import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

bool light = true;

ThemeData darkTheme = ThemeData(
  colorSchemeSeed: Colors.black,
  primaryColor: Colors.teal,
  brightness: Brightness.dark,
  fontFamily: "Inter",
);

ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.teal,
  primaryColor: Colors.white,
  brightness: Brightness.light,
  fontFamily: "Inter",
);
void showToast({required String message, required ToastStates state}) =>
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: chooseToastColor(state),
        textColor: Colors.white,
        fontSize: 16.0);

enum ToastStates { SUCCESS, ERROR, WARNING }

Color? chooseToastColor(ToastStates state) {
  Color? color;

  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
  }
  return color;
}
