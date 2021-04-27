import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
  @override
  void initState() {
    super.initState();
    //Chamado após o build ser criado
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<NewTaskController>(context, listen: false).addListener(() {
        var controller = context.read<NewTaskController>();
        if (controller.error != null) {
          final _snackBar = SnackBar(
            backgroundColor: Colors.red[300],
            content: Text(
              controller.error,
              style: GoogleFonts.oswald(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.red[800],
              ),
            ),
            action: SnackBarAction(
              textColor: Colors.red[800],
              label: 'X',
              onPressed: () {},
            ),
            shape: RoundedRectangleBorder(),
          );

          ScaffoldMessenger.of(context).showSnackBar(_snackBar);
        }
        if (controller.saved) {
          final _snackBar = SnackBar(
            backgroundColor: Colors.green[300],
            content: Text(
              'Tarefa inserida com sucesso!',
              style: GoogleFonts.oswald(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.green[800],
              ),
            ),
            action: SnackBarAction(
              textColor: Colors.green[800],
              label: 'X',
              onPressed: () {},
            ),
            shape: RoundedRectangleBorder(),
          );

          ScaffoldMessenger.of(context).showSnackBar(_snackBar);
          Future.delayed(Duration(seconds: 1), () => Navigator.pop(context));
        }
      });
    });
  }

  @override
  void dispose() {
    Provider.of<NewTaskController>(context, listen: false)
        .removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NewTaskController>(
      builder: (context, controller, _) {
        return Scaffold(
          backgroundColor: widget.themeData.backgroundColor,
          appBar: AppBar(
            backgroundColor: widget.themeData.backgroundColor,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Form(
              key: controller.formKey,
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
                              '${controller.dayFormated}',
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
                            padding:
                                EdgeInsets.only(left: 4, top: 8, bottom: 4),
                            child: Text('Descricao da Tarefa:'),
                          ),
                          TextFormField(
                            controller: controller.nomeTaskController,
                            decoration: InputDecoration(
                              hintText: 'Tarefa',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            validator: (value) {
                              if (value.isEmpty)
                                return 'Nome da tarefa obrigatória.';

                              return null;
                            },
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
                        child: TimeComponent(
                          date: controller.daySelected,
                          onSelectedTime: (date) {
                            controller.daySelected = date;
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 50),
                    _buildButton(controller),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildButton(NewTaskController controller) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        child: Center(
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            curve: Curves.decelerate,
            width: controller.saved ? 80 : MediaQuery.of(context).size.width,
            height: controller.saved ? 80 : 40,
            decoration: BoxDecoration(
              color: widget.themeData.primaryColor,
              borderRadius: controller.saved
                  ? BorderRadius.circular(180)
                  : BorderRadius.circular(8),
              boxShadow: [
                controller.saved
                    ? BoxShadow(
                        offset: Offset(2, 2),
                        blurRadius: 30,
                        color: widget.themeData.primaryColor,
                      )
                    : BoxShadow(
                        offset: Offset(2, 2),
                        blurRadius: 1,
                        color: widget.themeData.primaryColor,
                      ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: !controller.saved ? 0 : 80,
                  child: AnimatedOpacity(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInBack,
                    opacity: !controller.saved ? 0 : 1,
                    child: Icon(
                      Icons.check,
                      color: Colors.white54,
                      size: 32,
                    ),
                  ),
                ),
                Visibility(
                  visible: !controller.saved,
                  child: Center(
                    child: Text(
                      'Salvar',
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        onTap: () => !controller.saved ? controller.saveNewTask() : null,
        //controller.saveNewTask(, dateTime)
      ),
    );
  }
}
