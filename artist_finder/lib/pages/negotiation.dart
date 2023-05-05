// Referências:
// https://www.youtube.com/watch?v=uiJF-ShOLyo
import 'package:flutter/material.dart';
import 'package:artist_finder/components/negotiation_body.dart';
import 'package:artist_finder/models/Artist.dart';

class NegotiationPage extends StatelessWidget {
  final Artist artist;
  const NegotiationPage({super.key, required this.artist});

  @override
  Widget build(BuildContext context) {
    void goBack() {
      Navigator.of(context).pop();
    }

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
        title: Row(children: [
          IconButton(icon: const BackButton(), onPressed: goBack),
          const CircleAvatar(
            backgroundImage: AssetImage('lib/images/pedro.jpg'),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Pedro Piaf",
                style: TextStyle(fontSize: 16),
              ),
            ],
          )
        ]),
      ),
      body: NegotiationBody(artist),
    );
  }
}
