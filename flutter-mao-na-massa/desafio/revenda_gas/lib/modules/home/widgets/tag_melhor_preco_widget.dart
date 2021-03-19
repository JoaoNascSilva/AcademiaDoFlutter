import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TagMelhorPreco extends StatelessWidget {
  bool visible = false;

  TagMelhorPreco(this.visible);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible ?? false,
      child: Container(
        margin: EdgeInsets.only(top: 10),
        width: 88,
        height: 24,
        decoration: BoxDecoration(
          color: Colors.orange[400],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4),
            bottomLeft: Radius.circular(4),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Icon(
                Icons.label,
                color: Colors.white,
                size: 18,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 2, right: 4),
              child: Center(
                child: RichText(
                  text: TextSpan(
                    text: 'Melhor Preco',
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
