import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import 'on_boarding.dart';

class FirstSplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: OnBoardScreen(),
      duration: 3000,
      imageSize: 130,
      imageSrc: "assets/image/health.png",
      textType: TextType.ScaleAnimatedText,
      textStyle: TextStyle(
        fontSize: 30.0,
      ),
      backgroundColor: Colors.white,
    );
  }
}
