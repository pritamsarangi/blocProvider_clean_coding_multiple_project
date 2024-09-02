import 'dart:convert';

import 'package:blocprovider_clean_coding/models/user/user_model.dart';
import 'package:flutter/cupertino.dart';

import '../storage/local_storage.dart';

class SessionController {
  static final SessionController _session = SessionController._internal();
  final LocalStorage localStorage = LocalStorage();
  UserModel user = UserModel();
  bool? isLogin;

  SessionController._internal(){
    isLogin = false;
  }

  factory SessionController(){
    return _session;
  }

  Future<void> saveUserInPerference(dynamic user) async {
    localStorage.setValue('token', jsonEncode(user));
    localStorage.setValue('isLogin', 'true');
  }

  Future<void> getUserFromPerference() async {
    try {
      var userData = await localStorage.readValue('token');
      var isLogin = await localStorage.readValue('isLogin');
      if (userData.isNotEmpty) {
        SessionController().user = UserModel.fromJson(jsonDecode(userData));
      }
      SessionController().isLogin = isLogin == 'true' ? true : false;
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}