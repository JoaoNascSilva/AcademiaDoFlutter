import 'package:flutter/material.dart';
import 'package:revenda_gas/app/repositories/user_repository.dart';

class SignUpController extends ChangeNotifier {
  UserRepository repository = UserRepository();
  var formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmarcaoSenhaController = TextEditingController();
  TextEditingController themeController = TextEditingController();

  String error;
  bool saved = false;
  bool loading = false;

  SignUpController();

  bool validarSenhas() {
    return (passwordController.text == confirmarcaoSenhaController.text);
  }

  Future<void> save() async {
    try {
      if (formKey.currentState.validate()) {
        loading = true;
        saved = false;

        await repository.save(
          emailController.text,
          nameController.text,
          passwordController.text,
          themeController.text,
        );

        saved = true;
        loading = false;
        notifyListeners();
      }
    } catch (e) {
      print(e);
      error = 'Erro ao salvar usuário';
    }
  }
}
