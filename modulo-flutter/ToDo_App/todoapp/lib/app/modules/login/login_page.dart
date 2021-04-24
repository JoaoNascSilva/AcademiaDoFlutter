import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:revenda_gas/app/modules/home/home_page.dart';

import 'login_controller.dart';
import 'signup_page.dart';

class LogInPage extends StatefulWidget {
  final ThemeData themeData;
  static String routerName = '/login';

  const LogInPage({Key key, this.themeData}) : super(key: key);

  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  bool isLoading = true;

  void _isEnableLoading() {
    setState(() {
      this.isLoading = false;
    });
  }

  void _isDisableLoading() {
    setState(() {
      this.isLoading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Consumer<LogInController>(
      builder: (BuildContext context, LogInController controller, _) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).viewPadding.top,
                  ),
                  _signIn(),
                  Card(
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
                            keyboardType: TextInputType.text,
                            textAlign: TextAlign.start,
                            textAlignVertical: TextAlignVertical.bottom,
                            style: GoogleFonts.oswald(
                              color: Colors.black87,
                            ),
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person,
                                size: 24,
                              ),
                              hintText: 'Usuario',
                              // labelText: 'Usuario',
                              // border: OutlineInputBorder(
                              //   borderSide: BorderSide(
                              //     width: 2,
                              //     color: Colors.black45,
                              //     style: BorderStyle.solid,
                              //   ),
                              // ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: TextFormField(
                            obscureText: true,
                            keyboardType: TextInputType.text,
                            textAlign: TextAlign.start,
                            textAlignVertical: TextAlignVertical.bottom,
                            style: GoogleFonts.oswald(
                              color: Colors.black87,
                            ),
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock_outlined,
                                size: 24,
                              ),
                              hintText: 'Senha',
                              //labelText: 'Senha',
                              // border: OutlineInputBorder(
                              //   borderSide: BorderSide(
                              //     width: 2,
                              //     color: Colors.black45,
                              //     style: BorderStyle.solid,
                              //   ),
                              // ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 12),
                                      child: Icon(
                                        Icons.check_box_outline_blank_outlined,
                                        color: widget.themeData.primaryColor,
                                        size: 28,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 8),
                                      child: Text(
                                        'Lembrar-me',
                                        style: GoogleFonts.oswald(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 24, bottom: 24),
                              height: 48,
                              width: width * 0.40,
                              decoration: BoxDecoration(
                                color: widget.themeData.primaryColor,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(90),
                                  bottomLeft: Radius.circular(90),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  !this.isLoading
                                      ? CircularProgressIndicator(
                                          strokeWidth: 3,
                                        )
                                      : Icon(
                                          Icons.login_outlined,
                                          size: 32,
                                          color: Colors.white,
                                        ),
                                  InkWell(
                                    child: Text(
                                      'Entrar',
                                      style: GoogleFonts.oswald(
                                        fontSize: 24,
                                        color: Colors.white,
                                      ),
                                    ),
                                    onTap: () {
                                      print('Entrar...');
                                      _isEnableLoading();
                                      Future.delayed(Duration(seconds: 3))
                                          .then(
                                        (value) => Center(
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                          ),
                                        ),
                                      )
                                          .whenComplete(
                                        () {
                                          Navigator.pushNamed(
                                              context, HomePage.routerName);
                                          _isDisableLoading();
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SignUp(themeData: widget.themeData),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _signIn() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.only(left: 8, top: 8),
            child: Text(
              'Organize suas tarefas diarias de um jeito simples!',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 16),
          height: 48,
          width: 48,
          decoration: BoxDecoration(
            color: widget.themeData.primaryColor,
            borderRadius: BorderRadius.circular(180),
          ),
        ),
        Container(
          height: 112,
          width: 56,
          decoration: BoxDecoration(
            color: widget.themeData.primaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(180),
              bottomLeft: Radius.circular(180),
            ),
          ),
        ),
      ],
    );
  }
}

class SignUp extends StatelessWidget {
  final ThemeData themeData;

  const SignUp({Key key, this.themeData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24),
      child: Row(
        children: [
          Container(
            height: 112,
            width: 56,
            decoration: BoxDecoration(
              color: themeData.primaryColor,
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
              color: themeData.primaryColor,
              borderRadius: BorderRadius.circular(180),
            ),
          ),
          Expanded(
            child: InkWell(
              splashColor: Colors.transparent,
              child: Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right: 8, top: 8),
                child: Text(
                  'Registrar-se',
                  style: TextStyle(
                    fontSize: 28,
                    //fontStyle: FontStyle.italic,
                    // decoration: TextDecoration.underline,
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) {
                      return SignUpPage(
                        themeData: themeData,
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
