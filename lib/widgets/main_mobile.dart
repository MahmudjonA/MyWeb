import 'package:flutter/material.dart';
import 'package:my_parfolio/constants/colors.dart';

class MainMobile extends StatelessWidget {
  const MainMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 30.0),
      height: screenHeight,
      constraints: const BoxConstraints(minHeight: 560.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShaderMask(
                shaderCallback: (bounds) {
                  return LinearGradient(colors: [
                    CustomColor.scaffoldBg.withOpacity(0.6),
                    CustomColor.scaffoldBg.withOpacity(0.6),
                  ]).createShader(bounds);
                },
                blendMode: BlendMode.srcATop,
                child: Image.asset("assets/flutter_avatar.png",
                    width: screenWidth)),
            const SizedBox(height: 30),
            const Text(
              "Hi, \nI'm Maxmudjon M.A\nFlutter Developer",
              style: TextStyle(
                  fontSize: 24.0,
                  height: 1.5,
                  fontWeight: FontWeight.bold,
                  color: CustomColor.whitePrimary),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 190,
              child: ElevatedButton(
                  onPressed: () {}, child: const Text('Get in touch')),
            )
          ]),
    );
  }
}
