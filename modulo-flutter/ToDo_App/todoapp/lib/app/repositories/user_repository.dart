import 'package:revenda_gas/app/database/connection.dart';
import 'package:revenda_gas/app/models/user_model.dart';
import 'package:revenda_gas/app/shared/helpers/cryptoHelper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  Future<void> save(
      String name, String email, String password, String theme) async {
    password = CryptoHelper.generateSHA256Hash(password);

    var conn = await Connection().instance;
    conn.rawInsert(
      '''INSERT INTO user VALUES (?, ?, ?, ?, ?, ?);''',
      [
        null,
        name,
        email,
        password,
        true,
        theme,
      ],
    );
  }

  Future<UserModel> authenticateUser(String email, String password) async {
    var sharedPreferenceUser = await SharedPreferences.getInstance();

    var conn = await Connection().instance;
    var result = await conn.rawQuery(
      'SELECT id, email, user, password, isactive, theme FROM user WHERE email = ? AND password = ?;',
      [
        email,
        password,
      ],
    );

    var resultUser = result.map((e) => UserModel.fromMap(e)).single;
    sharedPreferenceUser.setInt('idUser', resultUser.id);
    return resultUser;
  }
}
