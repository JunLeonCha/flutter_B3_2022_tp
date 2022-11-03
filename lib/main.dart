import 'package:flutter/material.dart';
import 'package:mds_2022_tp/ui/screens/add_company.dart';
import 'package:mds_2022_tp/ui/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/home': (context) => Home(),
        '/addCompany': (context) => AddCompany()
      },
      initialRoute: '/home',
    );
  }
}
