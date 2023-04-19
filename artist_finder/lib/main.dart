import 'package:artist_finder/pages/artist_page.dart';
import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/create_account_page.dart';
import 'pages/contr_page.dart';
import 'pages/negotiation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NegotiationPage(), //LoginPage(), só para testar negociação
      routes: <String, WidgetBuilder>{
        "login": (BuildContext context) => LoginPage(),
        "createAccount": (BuildContext context) => CreateAccountPage(),
        "contrpage": (BuildContext context) => const ContrPage(),
        "artistpage": (BuildContext context) => ArtistPage(),
        "negotiation": (BuildContext context) => NegotiationPage(),
      },
    );
  }
}
