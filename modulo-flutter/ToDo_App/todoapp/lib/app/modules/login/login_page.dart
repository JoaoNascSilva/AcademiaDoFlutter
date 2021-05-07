import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:revenda_gas/app/modules/home/home_page.dart';
import 'package:revenda_gas/app/modules/login/signup_page.dart';
import 'package:revenda_gas/app/shared/app_colors.dart';

import 'login_controller.dart';

class LogInPage extends StatefulWidget {
  static String routerName = '/login';

  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        Provider.of<LogInController>(context, listen: false).addListener(
          () {
            var controller = context.read<LogInController>();
            if (controller.error != null) {
              final _snackBar = SnackBar(
                backgroundColor: Colors.red[300],
                content: Text(
                  controller.error,
                  style: GoogleFonts.oswald(
                    fontSize: 16,
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
          },
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Consumer<LogInController>(
      builder: (context, controller, _) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'ToDo App',
              style: GoogleFonts.oswald(
                fontSize: 28,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Form(
              key: controller.formKey,
              child: SizedBox(
                height: MediaQuery.of(context).size.height - 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _signIn(),
                    Container(
                      child: Card(
                        margin: EdgeInsets.all(12),
                        elevation: 4,
                        shadowColor: Colors.grey[400].withOpacity(0.4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: TextFormField(
                                controller: controller.emailController,
                                keyboardType: TextInputType.text,
                                textAlign: TextAlign.start,
                                textAlignVertical: TextAlignVertical.bottom,
                                //style: GoogleFonts.oswald(),
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.person,
                                    size: 24,
                                  ),
                                  hintText: 'E-Mail',
                                  labelText: 'E-Mail',
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 2,
                                      color: Colors.black45,
                                      style: BorderStyle.solid,
                                    ),
                                  ),
                                ),
                                validator: (value) {
                                  if (value.isEmpty)
                                    return 'Campo email não informado.';

                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: TextFormField(
                                controller: controller.passwordController,
                                obscureText: true,
                                keyboardType: TextInputType.text,
                                textAlign: TextAlign.start,
                                textAlignVertical: TextAlignVertical.bottom,
                                style: GoogleFonts.oswald(),
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.lock_outlined,
                                    size: 24,
                                  ),
                                  hintText: 'Senha',
                                  labelText: 'Senha',
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 2,
                                      color: Colors.black45,
                                      style: BorderStyle.solid,
                                    ),
                                  ),
                                ),
                                validator: (value) {
                                  if (value.isEmpty)
                                    return 'Campo senha não informado.';

                                  return null;
                                },
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 24, bottom: 24),
                                  height: 48,
                                  width: width * 0.40,
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(90),
                                      bottomLeft: Radius.circular(90),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.login_outlined,
                                        size: 32,
                                        color: Colors.white,
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          print('Entrar...');
                                          await controller.authenticateUser();

                                          if (controller.search) {
                                            Navigator.pushNamed(
                                              context,
                                              HomePage.routerName,
                                            );
                                          }
                                        },
                                        child: Text(
                                          'Entrar',
                                          style: GoogleFonts.oswald(
                                            fontSize: 24,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SignUp(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _signIn() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.16,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 8, top: 8),
              child: Text(
                'Organize suas tarefas diarias de um jeito simples!',
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 16),
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(180),
            ),
          ),
          Container(
            height: 112,
            width: 56,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(180),
                bottomLeft: Radius.circular(180),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.16,
      child: Row(
        children: [
          Container(
            height: 112,
            width: 56,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(180),
                bottomRight: Radius.circular(180),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 16),
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(180),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextButton(
                child: Text(
                  'Registrar-se',
                  style: GoogleFonts.oswald(
                    fontSize: 24,
                    color: AppColors.white,
                  ),
                ),
                style: ButtonStyle(
                  alignment: Alignment.centerRight,
                  elevation: MaterialStateProperty.resolveWith(
                    (states) => 0,
                  ),
                  backgroundColor: MaterialStateProperty.resolveWith(
                    (states) => Colors.transparent,
                  ),
                  overlayColor: MaterialStateProperty.resolveWith(
                    (states) => Colors.transparent,
                  ),
                ),
                onPressed: () {
                  print('Registrar...');
                  Navigator.pushNamed(
                    context,
                    SignUpPage.routerName,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
