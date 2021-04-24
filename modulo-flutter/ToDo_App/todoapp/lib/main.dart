import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter/widgets.dart';
import 'package:revenda_gas/app/database/connection.dart';
import 'package:revenda_gas/app/modules/home/home_controller.dart';
import 'package:revenda_gas/app/modules/home/home_page.dart';
import 'package:revenda_gas/app/modules/login/login_controller.dart';
import 'package:revenda_gas/app/modules/login/login_page.dart';
import 'package:revenda_gas/app/modules/login/signup_controller.dart';
import 'package:revenda_gas/app/modules/login/signup_page.dart';
import 'package:revenda_gas/app/modules/new_task.dart/new_task_controller.dart';
import 'package:revenda_gas/app/repositories/todos_repository.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'app/modules/new_task.dart/new_task_page.dart';
import 'app/theme/dark_theme.dart';
import 'app/theme/light_theme.dart';

void main() => runApp(MyApp());

var theme = ThemeData(); // darkTheme();

var themeDark = darkTheme();
var themeLight = lightTheme();

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  bool setThemeDark = false;
  bool isLoading = false;

  void _updateTheme() {
    //-- Codigo abaixo e para alterar pela Configuracao do Aparelho/Plataforma
    //var brightness = WidgetsBinding.instance.window.platformBrightness;
    //brightness == Brightness.dark ? theme = themeDark : theme = themeClaro;
    theme = setThemeDark ? darkTheme() : lightTheme();

    setState(() {
      setThemeDark = !setThemeDark;
    });
  }

  @override
  void didChangePlatformBrightness() {
    _updateTheme();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    var connection = Connection();
    switch (state) {
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
        connection.closeConnection();
        break;
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    setState(() {
      this.isLoading = false;
    });
    _updateTheme();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => ToDosRepository(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('pt'),
        ],
        title: 'ToDo App',
        theme: theme,
        routes: {
          NewTaskPage.routerName: (_) => ChangeNotifierProvider(
                create: (context) => TaskController(
                  repository: context.read<ToDosRepository>(),
                ),
                child: NewTaskPage(themeData: theme),
              ),
          HomePage.routerName: (_) => ChangeNotifierProvider(
                create: (context) {
                  var repository = context.read<ToDosRepository>();
                  return HomeController(repository: repository);
                },
                child: HomePage(themeData: theme),
              ),
          SignUpPage.routerName: (_) => ChangeNotifierProvider(
                create: (_) {
                  return SignUpController();
                },
                child: SignUpPage(themeData: theme),
              ),
          LogInPage.routerName: (_) => ChangeNotifierProvider(
                create: (_) {
                  return LogInController();
                },
                child: LogInPage(themeData: theme),
              ),
        },
        home: Scaffold(
          backgroundColor: theme.backgroundColor.withOpacity(0.90),
          appBar: AppBar(
            title: Text(
              'ToDo App',
              style: GoogleFonts.oswald(
                fontSize: 28,
                fontWeight: FontWeight.w300,
              ),
            ),
            actions: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12, top: 4),
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                          text: 'Tema:',
                          style: GoogleFonts.oswald(fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 12, top: 4),
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _updateTheme();
                          });
                        },
                        child: Icon(
                          setThemeDark
                              ? Icons.brightness_4_rounded
                              : Icons.brightness_4_outlined,
                          color: setThemeDark ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          body: ChangeNotifierProvider(
            create: (_) => LogInController(), //LogInController(),
            child: LogInPage(themeData: theme),
          ),
        ),
      ),
    );
  }
}
