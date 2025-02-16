import 'package:flutter/material.dart';
import 'package:my_parfolio/constants/colors.dart';
import 'package:my_parfolio/constants/nav_items.dart';
import 'package:my_parfolio/styles/style.dart';
import 'package:my_parfolio/widgets/site_logo.dart';

class HeaderDesktop extends StatelessWidget {
  const HeaderDesktop({super.key, required this.onNavMeny});
  final Function(int) onNavMeny;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      width: double.maxFinite,
      decoration: KHeaderDecoration,
      child: Row(children: [
        SiteLogo(
          onTap: () {
            
          },
        ),
        const Spacer(),
        for (int i = 0; i < navTitles.length; i++)
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: TextButton(
              onPressed: () {
                onNavMeny(i);
              },
              child: Text(navTitles[i],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: CustomColor.whitePrimary,
                  )),
            ),
          )
      ]),
    );
  }
}
