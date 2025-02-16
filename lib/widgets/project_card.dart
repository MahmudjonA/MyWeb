import 'package:flutter/material.dart';
import 'package:my_parfolio/constants/colors.dart';
import 'package:my_parfolio/utils/projects_utils.dart';
import 'dart:js' as js;

class ProjectCardWidget extends StatelessWidget {
  const ProjectCardWidget({super.key, required this.project});

  final ProjectsUtils project;
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      height: 290,
      width: 260,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: CustomColor.bLight2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Project image
          Image.asset(
            project.image,
            height: 140,
            width: 260,
            fit: BoxFit.cover,
          ),
          // Title
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 15, 12, 12),
            child: Text(
              project.title,
              style: const TextStyle(
                  fontWeight: FontWeight.w600, color: CustomColor.whitePrimary),
            ),
          ),
          // Subtitle
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: Text(
              project.subtitle,
              style: const TextStyle(
                  fontSize: 12, color: CustomColor.whiteSecondary),
            ),
          ),
          const Spacer(),
          // Footer
          Container(
            color: CustomColor.bLight1,
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(children: [
              const Text(
                "Available on",
                style: TextStyle(color: CustomColor.yellowSecondary),
              ),
              const Spacer(),
              if (project.iosLink != null)
                InkWell(
                    onTap: () {
                      js.context.callMethod("open", [project.iosLink]);
                    },
                    child: Image.asset(
                      "assets/android.png",
                      width: 17,
                    )),
              if (project.androidLimk != null)
                Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: InkWell(
                      onTap: () {},
                      child: InkWell(
                          onTap: () {
                            js.context
                                .callMethod("open", [project.androidLimk]);
                          },
                          child: Image.asset(
                            "assets/web.png",
                            width: 17,
                          ))),
                ),
              if (project.webLimk != null)
                Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: InkWell(
                      onTap: () {
                        js.context.callMethod("open", [project.webLimk]);
                      },
                      child: Image.asset(
                        "assets/ios.png",
                        width: 17,
                      )),
                ),
            ]),
          )
        ],
      ),
    );
  }
}
