import 'package:flutter/material.dart';
import 'screens/welcome.dart';

void main() {
  runApp(MCADepartmentApp());
}

class MCADepartmentApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MCA Department',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF0D1B2A),
        scaffoldBackgroundColor: Color(0xFFF5F5F5),
        fontFamily: 'Roboto',
      ),
      home: WelcomePage(),
    );
  }
}
