import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';

class FlushBarHelper{
  static void flushBarErrorMessage(String message, BuildContext context){
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
          barBlur: 20,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: const EdgeInsets.all(15),
          message: message,
          duration: const Duration(seconds: 3),
          borderRadius: BorderRadius.circular(20),
          flushbarPosition: FlushbarPosition.TOP,
          backgroundColor: Colors.red,
          reverseAnimationCurve: Curves.fastEaseInToSlowEaseOut,
          positionOffset: 20,
          icon: const Icon(
            Icons.error,
            size: 28,
            color: Colors.white,
          ),
        )..show(context));
  }
  static void flushBarSuccessMessage(String message, BuildContext context){
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
          barBlur: 20,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: const EdgeInsets.all(15),
          message: message,
          duration: const Duration(seconds: 3),
          borderRadius: BorderRadius.circular(20),
          flushbarPosition: FlushbarPosition.TOP,
          backgroundColor: Colors.green,
          reverseAnimationCurve: Curves.fastEaseInToSlowEaseOut,
          positionOffset: 20,
          icon: const Icon(
            Icons.check_circle_rounded,
            size: 28,
            color: Colors.white,
          ),
        )..show(context));
  }
}