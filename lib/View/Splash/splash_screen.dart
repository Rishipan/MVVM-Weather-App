import 'package:flutter/material.dart';
import 'package:getx_mvvm_weather_with_apis/ViewModel/Services/Splash%20Screen/splash_services.dart';

import '../../Resources/Colors/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SplashServices.getApiData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppColors.buildGradientBoxDecoration(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Image.asset(
            'assets/images/rainbow.png',
            height: 200,
            width: 200,
          ),
        ),
      ),
    );
  }
}
