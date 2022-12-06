import 'package:flutter/material.dart';
import 'package:real_state_web/constants.dart';
import 'package:real_state_web/responsive.dart';
import 'package:real_state_web/widgets/menu/side_menu_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key, required this.mainSection}) : super(key: key);
  final Widget mainSection;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isDesktop(context)
          ? null
          : AppBar(
              backgroundColor: kBgColor,
              leading: Builder(
                builder: (context) => IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: Icon(Icons.menu),
                ),
              ),
            ),
      drawer: const SideMenuSection(),
      body: SafeArea(
        child: Center(
          child: Container(
            //بتخلي width ثابت
            constraints:const BoxConstraints(maxWidth: 1440.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (Responsive.isDesktop(context))
                  const Expanded(
                    flex: 2,
                    child: SideMenuSection(),
                  ),
                const SizedBox(width: kDefaultPadding),
                Expanded(
                  flex: 7,
                  child: mainSection,
                ),
                const SizedBox(width: kDefaultPadding),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
