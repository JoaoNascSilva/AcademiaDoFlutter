import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:revenda_gas/app/modules/home/home_controller.dart';
import 'package:revenda_gas/app/shared/app_colors.dart';
import 'widgets/body_list_todo_widget.dart';

class HomePage extends StatefulWidget {
  static String routerName = '/home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (BuildContext context, HomeController controller, _) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: Container(
              color: AppColors.primaryColor,
            ),
          ),
          body: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BodyListTodo(
                  controller: controller,
                ),
              ],
            ),
          ),
          bottomNavigationBar: FFNavigationBar(
            theme: FFNavigationBarTheme(
              itemWidth: 60,
              barHeight: 70,
              barBackgroundColor: AppColors.primaryColor,
              selectedItemBorderColor: Colors.white,
              selectedItemIconColor: Colors.white,
              unselectedItemIconColor: Colors.white,
              selectedItemLabelColor: Colors.white,
              unselectedItemLabelColor: Colors.white.withOpacity(0.8),
              selectedItemBackgroundColor: AppColors.primaryColor,
              unselectedItemBackgroundColor: AppColors.primaryColor,
              selectedItemTextStyle: GoogleFonts.oswald(
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
              unselectedItemTextStyle: GoogleFonts.oswald(
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
            ),
            selectedIndex: controller.selectedTab,
            items: [
              FFNavigationBarItem(
                label: 'Finalizados',
                iconData: Icons.check_circle_outline,
              ),
              FFNavigationBarItem(
                label: 'Semanal',
                iconData: Icons.calendar_view_day_outlined,
              ),
              FFNavigationBarItem(
                label: 'Selecionar Data',
                iconData: Icons.date_range_outlined,
              ),
              FFNavigationBarItem(
                label: 'Logoff',
                iconData: Icons.person,
              ),
            ],
            onSelectTab: (int index) {
              controller.changeSelectedTab(context, index);
            },
          ),
        );
      },
    );
  }
}
