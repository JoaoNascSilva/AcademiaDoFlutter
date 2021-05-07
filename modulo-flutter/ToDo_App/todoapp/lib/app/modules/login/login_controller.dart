import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:revenda_gas/app/repositories/user_repository.dart';
import 'package:revenda_gas/app/shared/helpers/cryptoHelper.dart';

class LogInController extends ChangeNotifier {
  final UserRepository repository;
  final DateFormat dateFormat = DateFormat('dd/MM/yyyy');
  var formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool loading = false;
  String error;
  bool search = false;

  bool themeDark = false;

  LogInController({
    @required this.repository,
  });

  bool updateTheme(bool value) {
    this.themeDark = !value;
    print('Theme Dark ? $themeDark');
    this.notifyListeners();
    return this.themeDark;
  }

  Future<void> authenticateUser() async {
    //UserModel userModel;
    try {
      if (formKey.currentState.validate()) {
        loading = true;
        search = false;
        await repository.authenticateUser(emailController.text,
            CryptoHelper.generateSHA256Hash(passwordController.text));
        loading = false;
        search = true;
        //return userModel;
      }
    } catch (e) {
      print(e);
      error = 'Erro ao autenticar usuário.';
      loading = false;
    }
    notifyListeners();
  }
}
