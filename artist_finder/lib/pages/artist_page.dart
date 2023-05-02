import 'package:artist_finder/components/url.dart';
import 'package:artist_finder/pages/proposal_received.dart';
import 'package:flutter/material.dart';
import 'package:artist_finder/components/personalized_button.dart';
import 'proposal.dart';
import 'avaliation.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class ArtistPage extends StatefulWidget {
  const ArtistPage({
    super.key,
  });

  @override
  State<ArtistPage> createState() => _ArtistPageState();
}

class _ArtistPageState extends State<ArtistPage> {
  final nameController = TextEditingController();
  List<String> commentaux = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("ArtistFinder"),
          backgroundColor: Colors.blue[600],
          centerTitle: true,
          bottomOpacity: 10,
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(children: [
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              const SizedBox(width: 10),
              if (activeartist.image_url != null)
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: Colors.blue, width: 4)),
                    child: Image.network(
                      activeartist.image_url,
                      fit: BoxFit.cover,
                      height: 80,
                      width: 80,
                    ))
              else
                const Icon(
                  Icons.person_2_rounded,
                  size: 100,
                ),
              const SizedBox(width: 20),
              Column(children: [
                Text(
                  'Name:',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  activeartist.username,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.grey[700]),
                )
              ]),
              const SizedBox(width: 10),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const PersonalizedButton(
                  page: ProposalReceived(), text: Text("Ver\n propostas")),
              const SizedBox(
                width: 16,
              ),
              PersonalizedButton(
                  page: Avaliation(
                    artist: activeartist,
                  ),
                  text: const Text("Agenda")),
              const SizedBox(
                width: 16,
              ),
              PersonalizedButton(
                  page: Avaliation(artist: activeartist),
                  text: const Text("Editar\nperfil"))
            ],
          ),
          const SizedBox(height: 30),
          Text(
            "Avaliação",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 15,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          RatingBar.builder(
            allowHalfRating: true,
            initialRating: activeartist.avaliation,
            minRating: 0,
            maxRating: 5,
            itemSize: 30,
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              null;
            },
            ignoreGestures: true,
          ),
          const SizedBox(height: 10),
          Text(
            'Numero de avaliações: ${activeartist.no_avaliations}',
            style: TextStyle(
                fontWeight: FontWeight.w200,
                fontSize: 15,
                color: Colors.grey[700]),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Descrição:',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 15,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            activeartist.description,
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 15,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Comentários sobre as prestações: ',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 20,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            height: 10,
            color: Colors.black,
          ),
          ListView.separated(
              separatorBuilder: (context, index) {
                return const Divider(
                  height: 10,
                  color: Colors.black,
                );
              },
              shrinkWrap: true,
              itemCount: commentaux.length,
              itemBuilder: (BuildContext context, index) {
                return ListTile(
                  title: Text(
                    commentaux[index],
                    style: GoogleFonts.notoSans(),
                  ),
                );
              }),
          const Divider(
            height: 10,
            color: Colors.black,
          )
        ]))));
  }
}
