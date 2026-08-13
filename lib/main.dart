import 'package:flutter/material.dart';

// dependencies
import 'package:hive_flutter/hive_flutter.dart';

// pages
import 'package:todo_application/pages/home_page.dart';

void main() async {
  //* INITIALIZE HIVE
  await Hive.initFlutter();

  //* OPEN HIVE BOX
  var box = await Hive.openBox("DataBox");

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
        colorSchemeSeed: Colors.white
      ),
    );
  }
}
