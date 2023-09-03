import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hivelearning/home_page.dart';
import 'package:hivelearning/person.dart';

import 'boxes.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(PersonAdapter());
  boxPersons = await Hive.openBox<Person>("personBox");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
