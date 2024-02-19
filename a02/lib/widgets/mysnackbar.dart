// ignore_for_file: avoid_print, use_key_in_widget_constructors

import 'package:a02/themes/theme.dart';
import 'package:flutter/material.dart';
import '../main.dart';

class MySnackBar {
  String text;
  MySnackBar({required this.text});

  void show() {
    //print(scaffoldMessengerKey.currentState);
    scaffoldMessengerKey.currentState?.showSnackBar(get());
  }

  SnackBar get() {
    return SnackBar(
      duration: const Duration(seconds: 5),
      behavior: SnackBarBehavior.floating,
      content: Row(
        children: [
          const Icon(Icons.favorite, color: pink50),
          const SizedBox(
            width: 10,
          ),
          Text(
            text,
            textScaler: const TextScaler.linear(0.9),
          ),
        ],
      ),
      action: SnackBarAction(
        textColor: pink50,
        label: 'Click ME',
        onPressed: () {
          print('hey you clicked on the snackbar Action');
        },
      ),
    );
  }
}
