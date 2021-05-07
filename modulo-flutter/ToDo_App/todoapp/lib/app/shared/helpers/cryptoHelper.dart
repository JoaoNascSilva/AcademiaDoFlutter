import 'dart:convert';

import 'package:crypto/crypto.dart';

class CryptoHelper {
  static String generateSHA256Hash(String password) {
    final bytes = utf8.encode(password);
    return sha256.convert(bytes).toString();
  }
}
