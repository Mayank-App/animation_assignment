
import 'package:flutter/material.dart';

import '../presentation/ui/login_screen/customWidget/congrats_dialog.dart';
import '../presentation/ui/home_screen.dart';

class Apputils{

  static bool isValidEmail(String email) {
    final RegExp emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegex.hasMatch(email);
  }

  static bool isValidPassword(String password) {
  final RegExp passwordRegex = RegExp(r'^.{6,}$');
  return passwordRegex.hasMatch(password);
}
}