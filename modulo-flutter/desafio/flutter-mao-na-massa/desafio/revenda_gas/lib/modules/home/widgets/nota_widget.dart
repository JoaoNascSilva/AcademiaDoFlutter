import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Nota extends StatelessWidget {
  double nota;

  Nota(this.nota);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              'Nota',
              style: TextStyle(
                fontSize: 12,
                color: Colors.black54,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(right: 18, bottom: 10),
            child: Row(
              children: [
                RichText(
                  text: TextSpan(
                    text: nota.toString() ?? '0.00',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Icon(
                  Icons.star,
                  size: 20,
                  color: Colors.yellow[400],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
