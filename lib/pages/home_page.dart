import 'package:flutter/material.dart';
import 'package:my_parfolio/constants/colors.dart';
import 'package:my_parfolio/constants/size.dart';
import 'package:my_parfolio/constants/sns_limk.dart';
import 'package:my_parfolio/widgets/contact_section.dart';
import 'package:my_parfolio/widgets/drawer_mobile.dart';
import 'package:my_parfolio/widgets/footer.dart';
import 'package:my_parfolio/widgets/header_desktop.dart';
import 'package:my_parfolio/widgets/header_mobile.dart';
import 'package:my_parfolio/widgets/main_desktop.dart';
import 'package:my_parfolio/widgets/main_mobile.dart';
import 'package:my_parfolio/widgets/project_section.dart';
import 'package:my_parfolio/widgets/skills_desctop.dart';
import 'package:my_parfolio/widgets/skills_mobile.dart';
import 'dart:js' as js;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  final List<GlobalKey> navbarKeys = List.generate(4, (index) => GlobalKey());

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
          key: scaffoldKey,
          backgroundColor: CustomColor.scaffoldBg,
          endDrawer: constraints.maxWidth >= kMinDesctopWidth
              ? null
              : DrawerMobile(
                  onNavItem: (int navIndex) {
                    scaffoldKey.currentState?.closeDrawer();
                    scrollToSection(navIndex);
                  },
                ),
          body: SingleChildScrollView(
            controller: ScrollController(),
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(
                  key: navbarKeys.first,
                ),
                //? Main
                if (constraints.maxWidth >= kMinDesctopWidth)
                  HeaderDesktop(onNavMeny: (int navIndex) {
                    scrollToSection(navIndex);
                  })
                else
                  HeaderMobile(
                    onLogoTap: () {},
                    onMenuTap: () {
                      scaffoldKey.currentState?.openEndDrawer();
                    },
                  ),
                if (constraints.maxWidth >= kMinDesctopWidth)
                  const MainDesktop()
                else
                  const MainMobile(),

                //? Skills
                Container(
                  key: navbarKeys[1],
                  width: screenWidth,
                  padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                  color: CustomColor.bLight1,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "What can i do",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: CustomColor.whitePrimary),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      if (constraints.maxWidth >= kMedDesctopWidth)
                        const SkillsDesktop()
                      else
                        const SkillsMobile()
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                //? Project
                ProjectSection(
                  key: navbarKeys[2],
                ),
                const SizedBox(
                  height: 30,
                ),
                //? Conact
                ContactSection(
                  key: navbarKeys[3],
                ),
                const SizedBox(
                  height: 30,
                ),
                //? Footer
                const Footer(),
              ],
            ),
          ));
    });
  }

  void scrollToSection(int navIndex) {
    if (navIndex == 4) {
      js.context.callMethod('open', [SnsLinks.blog]);
      return;
    }
    final key = navbarKeys[navIndex];
    Scrollable.ensureVisible(key.currentContext!,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }
}
