import 'package:sqflite/sqflite.dart';

void createV1(Batch batch) {
  batch.execute('''
    CREATE TABLE user(
      id integer PRIMARY KEY AUTOINCREMENT,
      email varchar(120),
      user varchar(60),
      password varchar(200),
      isactive integer,
      theme varchar(5)
    );
  ''');

  batch.execute('''
    CREATE TABLE todo (
      id integer PRIMARY KEY AUTOINCREMENT,
      description varchar (120),
      date_hour datetime,
      isfinished integer,
      iduser integer
    );
    ''');
}
