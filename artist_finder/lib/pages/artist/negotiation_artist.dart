// Referências:
// https://www.youtube.com/watch?v=uiJF-ShOLyo
import 'package:artist_finder/components/artist/chat_input_field_artist.dart';
import 'package:artist_finder/components/artist/message_artist.dart';
import 'package:artist_finder/models/Contratant.dart';
import 'package:flutter/material.dart';
import 'package:artist_finder/components/common/url.dart';
import 'package:artist_finder/models/ChatMessage.dart';

class NegotiationArtistPage extends StatefulWidget {
  final Contratant contratant;
  const NegotiationArtistPage({super.key, required this.contratant});
  @override
  _NegotiationArtistPageState createState() => _NegotiationArtistPageState();
}

class _NegotiationArtistPageState extends State<NegotiationArtistPage> {
  @override
  Widget build(BuildContext context) {
    void goBack() {
      Navigator.of(context).pop();
    }

    List getArtistmessages(List messages) {
      List artistMessages = [];
      for (int i = 0; i < messages.length; i++) {
        if (messages[i].id_contratante == widget.contratant.id) {
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
            const CircleAvatar(
              backgroundImage: NetworkImage('$api/images/DEFAULT.jpg'),
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.contratant.username,
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
                    itemBuilder: (context, index) => MessageArtist(
                          message: artist_messages[index],
                          contratant: widget.contratant,
                        )),
              ),
            ),
            ChatInputFieldArtist(
              contratant: widget.contratant,
            ),
          ],
        ));
  }
}
