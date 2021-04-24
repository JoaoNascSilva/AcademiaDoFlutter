import 'dart:convert';

class ToDoModel {
  int id;
  String description;
  DateTime dateHour;
  bool isfinished;

  ToDoModel({
    this.id,
    this.description,
    this.dateHour,
    this.isfinished,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'dateHour': dateHour.millisecondsSinceEpoch,
      'isfinished': isfinished,
    };
  }

  factory ToDoModel.fromMap(Map<String, dynamic> map) {
    return ToDoModel(
      id: map['id'],
      description: map['description'],
      dateHour: DateTime.parse(map['date_hour']),
      isfinished: map['isfinished'] == 0 ? false : true,
    );
  }

  String toJson() => json.encode(toMap());

  factory ToDoModel.fromJson(String source) =>
      ToDoModel.fromMap(json.decode(source));
}
