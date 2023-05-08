// Referências:
// https://www.youtube.com/watch?v=uiJF-ShOLyo
import 'package:flutter/material.dart';
import 'package:artist_finder/models/Artist.dart';
import 'package:artist_finder/components/common/url.dart';
import 'package:artist_finder/components/contratant/chat_input_field.dart';
import 'package:artist_finder/models/ChatMessage.dart';
import 'package:artist_finder/components/contratant/message.dart';

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

    List getArtistmessages(List messages) {
      List artistMessages = [];
      for (int i = 0; i < messages.length; i++) {
        if (messages[i].id_artista == widget.artist.id) {
          artistMessages.add(messages[i]);
        }
      }
      return artistMessages;
    }

    final artist_messages = getArtistmessages(demoChatMessages);

    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Row(children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  widget.artist.image_url ?? '$api/images/DEFAULT.jpg'),
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
            ),
          ]),
        ),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView.builder(
                    itemCount: artist_messages.length,
                    itemBuilder: (context, index) => Message(
                          message: artist_messages[index],
                          artist: widget.artist,
                        )),
              ),
            ),
            ChatInputField(
              artist: widget.artist,
            ),
          ],
        ));
  }
}
