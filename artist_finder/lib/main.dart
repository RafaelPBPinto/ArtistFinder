import 'package:artist_finder/pages/artist/artist_page.dart';
import 'package:flutter/material.dart';
import 'pages/common/login_page.dart';
import 'pages/common/create_account_page.dart';
import 'pages/contratant/contr_page.dart';

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
        "artistpage": (BuildContext context) => ArtistPage(),
        "contrpage": (BuildContext context) => ContrPage(),
      },
    );
  }
}
