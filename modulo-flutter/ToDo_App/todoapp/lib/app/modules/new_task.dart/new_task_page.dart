import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:revenda_gas/app/modules/new_task.dart/new_task_controller.dart';
import 'package:revenda_gas/app/shared/time_component.dart';

class NewTaskPage extends StatefulWidget {
  final ThemeData themeData;
  static String routerName = '/newtask';
  const NewTaskPage({Key key, this.themeData}) : super(key: key);

  @override
  _NewTaskPageState createState() => _NewTaskPageState();
}

class _NewTaskPageState extends State<NewTaskPage> {
  var dateFormat = DateFormat('dd/MM/yyyy');
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskController>(
      builder: (context, controller, _) {
        return Scaffold(
          backgroundColor: widget.themeData.backgroundColor,
          appBar: AppBar(
            backgroundColor: widget.themeData.backgroundColor,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            'NOVA TAREFA',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          child: Text(
                            'Data',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            '${dateFormat.format(DateTime.now())}',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 4, top: 8, bottom: 4),
                          child: Text('Descricao da Tarefa:'),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Tarefa',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 4),
                          child: Text('Horario:'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Container(
                      child: TimeComponent(),
                    ),
                  ),
                  SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        decoration: BoxDecoration(
                          color: widget.themeData.primaryColor,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            // BoxShadow(
                            //   blurRadius: 30,
                            //   color: widget.themeData.primaryColor,
                            // ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            'Salvar',
                            style: TextStyle(fontSize: 22, color: Colors.white),
                          ),
                        ),
                      ),
                      onTap: () {
                        //controller.saveNewTask(, dateTime)
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
