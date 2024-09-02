import 'dart:async';

import 'package:blocprovider_clean_coding/services/session-manager/session_controller.dart';
import 'package:flutter/material.dart';

import '../../config/routes/routes_name.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    SessionController().getUserFromPerference().then((value){
      if(SessionController().isLogin ?? false){
        Timer(
            const Duration(seconds: 3),
                () => Navigator.pushNamedAndRemoveUntil(
                context, RoutesName.homeScreen, (route) => false));
      }else{
        Timer(
            const Duration(seconds: 3),
                () => Navigator.pushNamedAndRemoveUntil(
                context, RoutesName.loginScreen, (route) => false));
      }
    }).onError((error, stackTrace) {
      Timer(
          const Duration(seconds: 3),
              () => Navigator.pushNamedAndRemoveUntil(
              context, RoutesName.loginScreen, (route) => false));
    });

  }
}
