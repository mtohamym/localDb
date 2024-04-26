import 'package:flutter/material.dart';

import 'feature/auth/view/login_screen.dart';
import 'splash_screen.dart';


class FoodNingaApp extends StatelessWidget {
  const FoodNingaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Ninga",
      home: SplashScreen(),
    );
  }
}
