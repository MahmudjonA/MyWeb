import 'package:flutter/material.dart';
import 'package:my_parfolio/constants/colors.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.symmetric(vertical: 20),
      width: double.maxFinite,
      alignment: Alignment.center,
      child: const Text(
        "Made by M.A with Flutter 3.10 ",
        style: TextStyle(
            fontWeight: FontWeight.w400, color: CustomColor.whitePrimary),
      ),
    );
  }
}
