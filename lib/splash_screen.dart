import 'dart:async';

import 'package:flutter/material.dart';
import 'package:session/core/local_storage/cache_helper/cache_helper.dart';
import 'package:session/feature/auth/view/login_screen.dart';
import 'package:session/feature/home/view/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(const Duration(seconds: 2), () async {

      String ? Token = CacheHelper.getData(key: 'token');
      if (Token != null) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ));
      }  else{
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ));

      }

    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            Icon(Icons.food_bank_rounded , size: 100, color: Colors.black,),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
