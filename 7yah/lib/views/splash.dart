import 'package:flutter/material.dart';

import '../cubit/app/cubit.dart';
import 'onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const OnBoardingScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppCubit.get(context).isDark
                ? Image.asset(
                    'assets/images/darkLogo.png',
                  )
                : Image.asset('assets/images/lightLogo.png'),
            const SizedBox(
              height: 30.0,
            ),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
