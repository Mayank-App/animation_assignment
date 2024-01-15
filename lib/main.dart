
import 'package:annimation_assignment/src/presentation/ui/login_screen/login_screen.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        dialogTheme:const DialogTheme(
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.transparent
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
           backgroundColor: Colors.blue, )
        )
      ),
      home:const LoginPage(),
    );
  }
}