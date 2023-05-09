// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:netflixapp/presentation/main_page/widgets/screen_main_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigatorHome();
    super.initState();
  }

  navigatorHome() async {
    await Future.delayed(
      const Duration(seconds: 4),
    );
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return MainPage();
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Lottie.asset('assets/splash/netflixjsonlottie.json'),
    ));
  }
}
