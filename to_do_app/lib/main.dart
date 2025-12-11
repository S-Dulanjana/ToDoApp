import 'package:flutter/material.dart';
import 'package:to_do_app/Pages/start_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ToDoApp",
      home: WelcomePage(),
    );
  }
}
