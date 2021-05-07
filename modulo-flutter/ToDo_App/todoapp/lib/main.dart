import 'package:flutter/material.dart';
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
import 'package:revenda_gas/app/repositories/user_repository.dart';
import 'package:revenda_gas/app/theme/app_theme.dart';
import 'app/modules/new_task.dart/new_task_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

ThemeData theme;

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  bool isLoading = false;

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
        Provider(
          create: (_) => UserRepository(),
        ),
        ChangeNotifierProvider(
          create: (_) => NewTaskController(),
        ),
        ChangeNotifierProvider(
          create: (_) => SignUpController(),
        ),
        ChangeNotifierProvider(
          create: (_) =>
              LogInController(repository: context.read<UserRepository>()),
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
        theme: AppTheme().darkTheme, // : AppTheme().lightTheme,
        routes: {
          NewTaskPage.routerName: (_) => ChangeNotifierProvider(
                create: (context) {
                  var day = ModalRoute.of(_).settings.arguments;
                  return NewTaskController(
                    repository: context.read<ToDosRepository>(),
                    day: day,
                  );
                },
                child: NewTaskPage(),
              ),
          HomePage.routerName: (_) => ChangeNotifierProvider(
                create: (context) {
                  var repository = context.read<ToDosRepository>();
                  return HomeController(
                    repository: repository,
                  );
                },
                child: HomePage(),
              ),
          SignUpPage.routerName: (_) => ChangeNotifierProvider(
                create: (context) {
                  return SignUpController();
                },
                child: SignUpPage(),
              ),
          LogInPage.routerName: (_) => ChangeNotifierProvider(
                create: (context) {
                  var repository = context.read<UserRepository>();
                  return LogInController(repository: repository);
                },
                child: LogInPage(),
              ),
        },
        home: ChangeNotifierProvider(
          //create: (context) => HomeController(repository: context.read<ToDosRepository>()), child: HomePage(themeData: theme),
          create: (context) =>
              LogInController(repository: context.read<UserRepository>()),
          child: LogInPage(),
        ),
      ),
    );
  }
}
