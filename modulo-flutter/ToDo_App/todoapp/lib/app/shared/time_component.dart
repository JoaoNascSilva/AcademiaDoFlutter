import 'package:flutter/material.dart';
import 'package:revenda_gas/app/shared/app_colors.dart';

class TimeComponent extends StatefulWidget {
  final DateTime date;
  final ValueChanged<DateTime> onSelectedTime;

  const TimeComponent({
    Key key,
    @required this.date,
    @required this.onSelectedTime,
  }) : super(key: key);
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

  String _hoursSelected = '00';
  String _minutesSelected = '00';
  String _secondsSelected = '00';

  void invokeCallback() {
    var newDate = DateTime(
      widget.date.year,
      widget.date.month,
      widget.date.day,
      int.parse(_hoursSelected),
      int.parse(_minutesSelected),
      int.parse(_secondsSelected),
    );

    widget.onSelectedTime(newDate);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildBox(_hours, (String value) {
          setState(() {
            _hoursSelected = value;
            invokeCallback();
          });
        }),
        Text(':', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        _buildBox(_minutes, (String value) {
          setState(() {
            _minutesSelected = value;
            invokeCallback();
          });
        }),
        Text(':', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        _buildBox(_seconds, (String value) {
          setState(() {
            _secondsSelected = value;
            invokeCallback();
          });
        }),
      ],
    );
  }

  _buildBox(List<String> options, ValueChanged<String> onChange) {
    return Container(
      height: 120,
      width: 100,
      decoration: BoxDecoration(
        color: AppColors.orange,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            spreadRadius: 0,
            blurRadius: 6,
            //  color: them primaryColor,
            offset: Offset(2, 5),
          ),
        ],
      ),
      child: ListWheelScrollView(
        onSelectedItemChanged: (value) => onChange(
          value.toString().padLeft(2, '0'),
        ),
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
