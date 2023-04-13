import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/create_account_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      routes: <String, WidgetBuilder>{
        "login": (BuildContext context) => LoginPage(),
        "createAccount": (BuildContext context) => CreateAccountPage(),
      },
    );
  }
}
