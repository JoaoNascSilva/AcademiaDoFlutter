import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:revenda_gas/app/modules/home/home_controller.dart';
import 'package:revenda_gas/app/modules/new_task.dart/new_task_page.dart';
import 'package:revenda_gas/main.dart';

class HomePage extends StatefulWidget {
  final ThemeData themeData;
  static String routerName = '/home';

  const HomePage({Key key, this.themeData}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (BuildContext context, HomeController controller, _) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Atividades da Semana',
              style: GoogleFonts.oswald(
                fontSize: 28,
                color: Colors.white,
              ),
            ),
          ),
          body: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BodyListTodo(
                    themeData: widget.themeData, controller: controller),
              ],
            ),
          ),
          bottomNavigationBar: FFNavigationBar(
            theme: FFNavigationBarTheme(
              itemWidth: 60,
              barHeight: 70,
              barBackgroundColor: this.widget.themeData.primaryColor,
              selectedItemBorderColor: Colors.white,
              selectedItemIconColor: Colors.white,
              unselectedItemIconColor: Colors.white,
              selectedItemLabelColor: Colors.white,
              unselectedItemLabelColor: Colors.white.withOpacity(0.8),
              selectedItemBackgroundColor: this.widget.themeData.primaryColor,
              unselectedItemBackgroundColor: this.widget.themeData.primaryColor,
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
              FFNavigationBarItem(label: 'Logoff', iconData: Icons.person),
            ],
            onSelectTab: (int index) {
              controller.changeSelectedTab(context, index, theme);
            },
          ),
        );
      },
    );
  }
}

class Header extends StatelessWidget {
  final ThemeData themeData;

  const Header({Key key, this.themeData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      height: MediaQuery.of(context).viewPadding.top + 52,
      color: themeData.primaryColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Icon(Icons.menu, color: Colors.white),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Text(
                'Atividades da Semana',
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BodyListTodo extends StatelessWidget {
  final ThemeData themeData;
  final HomeController controller;

  const BodyListTodo({
    Key key,
    this.themeData,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        separatorBuilder: (_, index) => Divider(height: 1),
        itemCount: controller.listTodos?.keys?.length ?? 0,
        itemBuilder: (_, index) {
          var dateFormat = DateFormat('dd/MM/yyyy');
          var listTodos = controller.listTodos;
          var dayKey = listTodos.keys.elementAt(index);
          var day = dayKey;
          var todos = listTodos[dayKey];

          if (listTodos.isEmpty && controller.selectedTab == 0) {
            return SizedBox.shrink();
          }

          var today = DateTime.now();
          if (dayKey == dateFormat.format(today)) {
            day = 'HOJE';
          } else if (dayKey ==
              dateFormat.format(today.add(Duration(days: 1)))) {
            day = 'AMANHÃ';
          }

          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      day,
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(),
                      child: IconButton(
                        onPressed: () async {
                          await Navigator.of(context).pushNamed(
                            NewTaskPage.routerName,
                            arguments: dayKey,
                          );
                          controller.update();
                        },
                        icon: Icon(
                          Icons.add_circle_outlined,
                          size: 38,
                        ),
                        color: themeData.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: todos.length,
                  itemBuilder: (_, index) {
                    var todo = todos[index];
                    var hourFormat = DateFormat('HH:mm');
                    return ListTile(
                      leading: Checkbox(
                        activeColor: themeData.primaryColor,
                        visualDensity: VisualDensity.adaptivePlatformDensity,
                        value: todo.isfinished,
                        onChanged: (bool value) {
                          controller.checkOrUnCheck(todo);
                        },
                      ),
                      title: Text(
                        todo.description,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          decoration: todo.isfinished
                              ? TextDecoration.lineThrough
                              : null,
                        ),
                      ),
                      trailing: Text(
                        hourFormat.format(todo.dateHour),
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          decoration: todo.isfinished
                              ? TextDecoration.lineThrough
                              : null,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
