import 'package:flutter/material.dart';
import 'package:oxy_boots/screens/02_onboarding/onboarding_screen.dart';

import '../../core/utils/app_color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool changePosition = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      const Duration(milliseconds: 100),
      () {
        changePosition = true;
        setState(() {});
      },
    );
    Future.delayed(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.splashbgColor,
        body: SafeArea(
          child: Stack(
            children: [
              AnimatedPositioned(
                top: changePosition ? 150 : 300,
                left: MediaQuery.of(context).size.width / 3.2,
                duration: const Duration(seconds: 2),
                child: const Text(
                  'OXY BOOTS',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: AppColor.textWhiteColor),
                ),
              ),
            ],
          ),
        ));
  }
}
