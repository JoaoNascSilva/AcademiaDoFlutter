import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Preco extends StatelessWidget {
  double preco;

  Preco(this.preco);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Center(
              child: Text(
                'Preco',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(right: 18, bottom: 10),
            child: Row(
              children: [
                RichText(
                  text: TextSpan(
                    text: 'R\$',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: preco > 0 ? preco.toString() : '0,00',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
