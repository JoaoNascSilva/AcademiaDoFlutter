import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TempoMedio extends StatelessWidget {
  String tempoMedio;

  TempoMedio(this.tempoMedio);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              'Tempo Medio',
              style: TextStyle(
                fontSize: 12,
                color: Colors.black54,
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(right: 18, bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  RichText(
                    text: TextSpan(
                      text: tempoMedio.isEmpty ? '00 - 00' : tempoMedio,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: ' min',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
