import 'package:flutter/material.dart';
import 'package:revenda_gas/main.dart';

class TimeComponent extends StatefulWidget {
  @override
  _TimeComponentState createState() => _TimeComponentState();
}

class _TimeComponentState extends State<TimeComponent> {
  final List<String> _hours = List.generate(24, (index) => index++)
      .map((e) => '${e.toString().padLeft(2, '0')}')
      .toList();
  final List<String> _minutes = List.generate(60, (index) => index++)
      .map((e) => '${e.toString().padLeft(2, '0')}')
      .toList();
  final List<String> _seconds = List.generate(60, (index) => index++)
      .map((e) => '${e.toString().padLeft(2, '0')}')
      .toList();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildBox(_hours),
        Text(':', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        _buildBox(_minutes),
        Text(':', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        _buildBox(_seconds),
      ],
    );
  }

  _buildBox(List<String> options) {
    return Container(
      height: 120,
      width: 100,
      decoration: BoxDecoration(
        color: theme.primaryColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            spreadRadius: 0,
            blurRadius: 6,
            color: theme.primaryColor,
            offset: Offset(2, 5),
          ),
        ],
      ),
      child: ListWheelScrollView(
        itemExtent: 60,
        perspective: 0.001,
        physics: FixedExtentScrollPhysics(),
        children: options
            .map<Text>(
              (e) => Text(
                e,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
