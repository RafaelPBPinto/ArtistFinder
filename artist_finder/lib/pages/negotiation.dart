// Referências:
// https://www.youtube.com/watch?v=uiJF-ShOLyo
import 'package:flutter/material.dart';
import 'package:artist_finder/components/negotiation_body.dart';
import 'package:artist_finder/models/Artist.dart';
import 'package:artist_finder/components/url.dart';
import 'package:artist_finder/components/chat_input_field.dart';
import 'package:artist_finder/models/ChatMessage.dart';
import 'package:artist_finder/components/message.dart';

class NegotiationPage extends StatefulWidget {
  final Artist artist;
  const NegotiationPage({super.key, required this.artist});
  @override
  _NegotiationPageState createState() => _NegotiationPageState();
}

class _NegotiationPageState extends State<NegotiationPage> {
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
            Image.network(
              widget.artist.image_url ?? '$api/images/DEFAULT.jpg',
              fit: BoxFit.cover,
              height: 40,
              width: 40,
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.artist.username,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            )
          ]),
        ),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView.builder(
                  itemCount: demoChatMessages.length,
                  itemBuilder: (context, index) =>
                      Message(message: demoChatMessages[index]),
                ),
              ),
            ),
            ChatInputField(),
          ],
        ));
  }
}
