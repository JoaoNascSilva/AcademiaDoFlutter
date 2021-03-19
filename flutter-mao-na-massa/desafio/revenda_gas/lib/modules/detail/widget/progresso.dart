import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Progresso extends StatelessWidget {
  String titulo;
  bool enable;

  Progresso(
    this.titulo,
    this.enable,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 18, right: 18, top: 18, bottom: 10),
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: this.enable ? Colors.blue : Colors.white,
            border: Border(
              top: BorderSide(width: 2, color: Colors.grey[300]),
              bottom: BorderSide(width: 2, color: Colors.grey[300]),
              left: BorderSide(width: 2, color: Colors.grey[300]),
              right: BorderSide(width: 2, color: Colors.grey[300]),
            ),
            borderRadius: BorderRadius.circular(90),
            boxShadow: [
              BoxShadow(
                blurRadius: 1,
                spreadRadius: this.enable ? 6 : 0,
                color: Colors.grey[300],
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 18, right: 18, bottom: 18),
          child: Text(
            this.titulo,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
        ),
      ],
    );
  }
}
