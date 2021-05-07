import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:revenda_gas/app/modules/new_task.dart/new_task_page.dart';
import 'package:revenda_gas/app/shared/app_colors.dart';

import '../home_controller.dart';

class BodyListTodo extends StatefulWidget {
  final ThemeData themeData;
  final HomeController controller;

  const BodyListTodo({
    Key key,
    this.themeData,
    this.controller,
  }) : super(key: key);

  @override
  _BodyListTodoState createState() => _BodyListTodoState();
}

class _BodyListTodoState extends State<BodyListTodo> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (_, index) => Divider(height: 0.2),
        itemCount: widget.controller.listTodos?.keys?.length ?? 0,
        itemBuilder: (_, index) {
          var dateFormat = DateFormat('dd/MM/yyyy');
          var listTodos = widget.controller.listTodos;
          var dayKey = listTodos.keys.elementAt(index);
          var day = dayKey;
          var todos = listTodos[dayKey];

          if (listTodos.isEmpty && widget.controller.selectedTab == 0) {
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
            mainAxisAlignment: MainAxisAlignment.end,
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
                          await widget.controller.update();
                        },
                        icon: Icon(
                          Icons.add_circle_outlined,
                          size: 38,
                        ),
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: todos.length,
                  itemBuilder: (_, index) {
                    var todo = todos[index];
                    var hourFormat = DateFormat('HH:mm');
                    return Dismissible(
                      key: UniqueKey(),
                      direction: DismissDirection.endToStart,
                      movementDuration: Duration(seconds: 2),
                      onDismissed: (_) {
                        widget.controller.remove(todo.id);
                        todos.removeAt(index);
                        final _snackBar = SnackBar(
                          duration: Duration(seconds: 2),
                          backgroundColor: Colors.green[300],
                          content: Text(
                            'Tarefa removida com sucesso',
                            style: GoogleFonts.oswald(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.green[800],
                            ),
                            textAlign: TextAlign.start,
                          ),
                          action: SnackBarAction(
                            textColor: Colors.green[800],
                            label: 'X',
                            onPressed: () {},
                          ),
                          shape: RoundedRectangleBorder(),
                        );

                        ScaffoldMessenger.of(context).showSnackBar(_snackBar);
                      },
                      background: Container(
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        color: Colors.red,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Excluir',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                            Icon(
                              Icons.delete_outline_rounded,
                              color: Colors.white,
                              size: 32,
                            ),
                          ],
                        ),
                      ),
                      //key: conttro
                      child: ListTile(
                        onTap: () {},
                        leading: Checkbox(
                          activeColor: AppColors.primaryColor,
                          visualDensity: VisualDensity.adaptivePlatformDensity,
                          value: todo.isfinished,
                          onChanged: (bool value) {
                            widget.controller.checkOrUnCheck(todo);
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
                            color: AppColors.primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            decoration: todo.isfinished
                                ? TextDecoration.lineThrough
                                : null,
                          ),
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
