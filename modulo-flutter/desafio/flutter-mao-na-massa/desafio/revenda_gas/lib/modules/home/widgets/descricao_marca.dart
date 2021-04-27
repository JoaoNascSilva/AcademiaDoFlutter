import 'package:flutter/material.dart';

Widget descricaoMarca({String descricao, Color cor}) {
  return Container(
    padding: EdgeInsets.all(2),
    width: 32,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(6),
        bottomLeft: Radius.circular(6),
      ),
      color: cor == null ? Colors.black : cor,
    ),
    child: RotatedBox(
      quarterTurns: -1,
      child: Center(
        child: Text(
          descricao != null ? descricao : 'Multimarcas',
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ),
    ),
  );
}
