import 'package:flutter/material.dart';

class ArtistPage extends StatefulWidget {
  ArtistPage({
    super.key,
  });

  @override
  State<ArtistPage> createState() => _ArtistPageState();
}

class _ArtistPageState extends State<ArtistPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [const Text("ArtistFinder")]),
    );
  }
}