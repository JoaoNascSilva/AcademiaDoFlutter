import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:revenda_gas/app/modules/login/signup_controller.dart';
import 'package:revenda_gas/app/shared/app_colors.dart';
import 'package:revenda_gas/app/shared/component/text_form_field_component.dart';
import 'login_page.dart';

class SignUpPage extends StatefulWidget {
  static String routerName = '/signup';

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        Provider.of<SignUpController>(context, listen: false).addListener(
          () {
            var controller = context.read<SignUpController>();
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
                  'Usuario inserido com sucesso!',
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
              Navigator.pushNamed(context, LogInPage.routerName);
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
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Consumer<SignUpController>(
      builder: (context, controller, _) {
        return Scaffold(
          appBar: PreferredSize(
            child: Container(
              color: AppColors.primaryColor,
            ),
            preferredSize: Size.fromHeight(0),
          ),
          body: SingleChildScrollView(
            child: Form(
              key: controller.formKey,
              child: Container(
                height: height - 110,
                width: width,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        SizedBox(height: 90),
                        Card(
                          elevation: 4,
                          margin: EdgeInsets.only(top: 64, left: 12, right: 12),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: TextFormFieldComponent(
                                  controller: controller.emailController,
                                  hint: 'E-Mail',
                                  icon: Icon(Icons.email_outlined),
                                  validate: (value) {
                                    if (value.isEmpty) {
                                      return 'Campo e-mail não informado.';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: TextFormFieldComponent(
                                  controller: controller.nameController,
                                  hint: 'Nome',
                                  icon: Icon(Icons.person),
                                  validate: (value) {
                                    if (value.isEmpty) {
                                      return 'Campo Nome não informado';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: TextFormFieldComponent(
                                  obscureText: true,
                                  controller: controller.passwordController,
                                  hint: 'Senha',
                                  icon: Icon(Icons.lock_outline),
                                  validate: (value) {
                                    if (value.isEmpty) {
                                      return 'Campo senha não informado';
                                    }
                                    if (!controller.validarSenhas())
                                      return 'Confirmação de senhas estão incorretas.';
                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: TextFormFieldComponent(
                                  controller:
                                      controller.confirmarcaoSenhaController,
                                  hint: 'Senha',
                                  obscureText: true,
                                  icon: Icon(Icons.person_outline_outlined),
                                  validate: (value) {
                                    if (value.isEmpty) {
                                      return 'Campo Nome não informado';
                                    }
                                    if (!controller.validarSenhas())
                                      return 'Confirmação de senhas estão incorretas.';

                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 12, right: 12, top: 4),
                          height: 48,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 1,
                                child: TextButton.icon(
                                  style: ButtonStyle(
                                    elevation: MaterialStateProperty
                                        .resolveWith<double>(
                                      (states) => 0,
                                    ),
                                    backgroundColor: MaterialStateProperty
                                        .resolveWith<Color>(
                                      (states) => AppColors.red,
                                    ),
                                  ),
                                  icon: Icon(
                                    Icons.cancel_outlined,
                                    size: 24,
                                    color: Colors.red[900],
                                  ),
                                  label: Text(
                                    'Cancelar',
                                    style: TextStyle(
                                      color: Colors.red[900],
                                      fontSize: 18,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.pushReplacementNamed(
                                      context,
                                      LogInPage.routerName,
                                    );
                                  },
                                ),
                              ),
                              Divider(endIndent: 8),
                              Expanded(
                                flex: 1,
                                child: TextButton.icon(
                                  style: ButtonStyle(
                                    elevation: MaterialStateProperty
                                        .resolveWith<double>(
                                      (states) => 0,
                                    ),
                                    backgroundColor:
                                        MaterialStateProperty.resolveWith(
                                      (states) => AppColors.green,
                                    ),
                                  ),
                                  icon: Icon(
                                    Icons.check_circle_outline,
                                    size: 24,
                                    color: Colors.green[900],
                                  ),
                                  label: Text(
                                    'Salvar',
                                    style: TextStyle(
                                      color: Colors.green[900],
                                      fontSize: 18,
                                    ),
                                  ),
                                  onPressed: () {
                                    controller.themeController.text = 'Light';
                                    controller.save();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      top: 10, //height * 0.12,
                      width: width,
                      child: CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 58,
                          backgroundColor: AppColors.backgroundColor,
                          child: Icon(
                            Icons.person_outline_outlined,
                            color: Colors.white,
                            size: 64,
                          ),
                          //'https://uifaces.co/our-content/donated/5qGL6bdj.png'),
                        ),
                      ),
                    ),
                    Positioned(
                      top: height * 0.06,
                      width: width,
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          '', //controller.nomeController ?? '',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 112,
                      right: 148,
                      child: CircleAvatar(
                        radius: 14,
                        backgroundColor: AppColors.white,
                        child: CircleAvatar(
                          child: Center(
                            child: Icon(
                              Icons.camera_alt_outlined,
                              color: AppColors.primaryColor,
                              size: 16,
                            ),
                          ),
                          backgroundColor: Colors.grey[300],
                          radius: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
