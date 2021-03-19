import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:revenda_gas/model/companhia.dart';

class CompanhiaRepository {
  Future<List<Companhia>> buscarTodasCompanhias() async {
    var jsonFile = await rootBundle.loadString('assets/server/dados.json');
    var companhias = json.decode(jsonFile) as List;
    return companhias.map((e) => Companhia.fromMap(e)).toList();
  }
}
