import 'package:revenda_gas/app/database/connection.dart';
import 'package:revenda_gas/app/models/user_model.dart';

class UserRepository {
  Future<void> save(String name, String email, String password) async {
    var conn = await Connection().instance;
    conn.rawInsert(
        'INSERT INTO user (?,?,?,?);', [null, name, email, password]);
  }

  Future<UserModel> login(String email, String password) async {
    var conn = await Connection().instance;
    var result = await conn.rawQuery(
        'SELECT * FROM user WHERE email = ? AND password = ?;',
        [email, password]);

    return result.map((e) => UserModel.fromMap(e)).single;
  }
}
