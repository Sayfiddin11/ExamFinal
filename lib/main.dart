import 'package:exam/routes/route.dart';
import 'package:flutter/material.dart';
import 'core/theme/theme.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  
  final _forRoute = Routes();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeComp.lightTheme,
      initialRoute: '/splash',
      onGenerateRoute: _forRoute.ongenerateRoute,
    );
  }
}

