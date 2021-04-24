import 'package:flutter/material.dart';

import 'login_page.dart';

class SignUpPage extends StatefulWidget {
  final ThemeData themeData;
  static String routerName = '/signup';

  const SignUpPage({Key key, this.themeData}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String name;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final heightStatusBar = MediaQuery.of(context).padding.top;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      key: _formKey,
      backgroundColor: widget.themeData.backgroundColor,
      //appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: heightStatusBar,
              child: Container(color: widget.themeData.primaryColor),
            ),
            Container(
              height: height - heightStatusBar,
              width: width,
              child: Stack(
                children: [
                  Column(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: height * 0.22,
                        decoration: BoxDecoration(
                          color: widget.themeData.primaryColor,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(520),
                            bottomLeft: Radius.circular(520),
                          ),
                        ),
                      ),
                      Card(
                        elevation: 4,
                        //height: height * 0.44,
                        margin: EdgeInsets.only(top: 64, left: 12, right: 12),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: TextFormField(
                                textAlignVertical: TextAlignVertical.bottom,
                                decoration: InputDecoration(
                                  hintText: 'E-Mail',
                                  border: OutlineInputBorder(),
                                  errorStyle: TextStyle(),
                                  prefixIcon: Icon(
                                    Icons.person_outline_outlined,
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.red[800],
                                    ),
                                  ),
                                ),
                                style: TextStyle(),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: TextFormField(
                                textAlignVertical: TextAlignVertical.bottom,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  hintText: 'Nome de usuario para acesso',
                                  border: OutlineInputBorder(),
                                  errorStyle: TextStyle(),
                                  prefixIcon: Icon(
                                    Icons.person_outline_outlined,
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.red[800],
                                    ),
                                  ),
                                ),
                                style: TextStyle(),
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    print('Validador...');
                                    return 'Campo invalido';
                                  }
                                  // ScaffoldMessenger.of(context).showSnackBar(
                                  //     SnackBar(content: Text('Campo Invalido')));
                                  return null;
                                },
                                onChanged: (String value) {
                                  setState(() {
                                    this.name = value;
                                  });
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: TextFormField(
                                textAlignVertical: TextAlignVertical.bottom,
                                obscureText: true,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: 'Senha',
                                  border: OutlineInputBorder(),
                                  errorStyle: TextStyle(),
                                  prefixIcon: Icon(Icons.lock_outline),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.red[800],
                                    ),
                                  ),
                                ),
                                style: TextStyle(),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: TextFormField(
                                textAlignVertical: TextAlignVertical.bottom,
                                obscureText: true,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: 'Confirmar Senha',
                                  border: OutlineInputBorder(),
                                  errorStyle: TextStyle(),
                                  prefixIcon: Icon(Icons.lock_outline),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.red[800],
                                    ),
                                  ),
                                ),
                                style: TextStyle(),
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
                                  elevation:
                                      MaterialStateProperty.resolveWith<double>(
                                    (states) => 0,
                                  ),
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                    (states) => Colors.red[400],
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
                                  Navigator.pop(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) {
                                        return SignUpPage();
                                      },
                                    ),
                                  );
                                },
                              ),
                            ),
                            Divider(endIndent: 8),
                            Expanded(
                              flex: 1,
                              child: TextButton.icon(
                                style: ButtonStyle(
                                  elevation:
                                      MaterialStateProperty.resolveWith<double>(
                                    (states) => 0,
                                  ),
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith(
                                    (states) => Colors.green[400],
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
                                      color: Colors.green[900], fontSize: 18),
                                ),
                                onPressed: () {
                                  // if (!_formKey.currentState.validate())
                                  // ScaffoldMessenger.of(context).showSnackBar(
                                  //   SnackBar(
                                  //     content: Text(
                                  //         'Usuario registrado com sucesso.',
                                  //         style: TextStyle(
                                  //             fontSize: 14,
                                  //             color: Colors.green[900])),
                                  //     backgroundColor: Colors.green[400],
                                  //   ),
                                  // );

                                  Navigator.pop(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) {
                                        return LogInPage(
                                            themeData: widget.themeData);
                                      },
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: height * 0.12,
                    width: width,
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 58,
                        backgroundColor: widget.themeData.backgroundColor,
                        backgroundImage: NetworkImage(
                            'https://uifaces.co/our-content/donated/5qGL6bdj.png'),
                      ),
                    ),
                  ),
                  Positioned(
                    top: height * 0.06,
                    width: width,
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        name ?? '',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
