import 'package:artist_finder/components/my_button.dart';
import 'package:flutter/material.dart';
import 'package:artist_finder/models/Artist.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'avaliation.dart';

class ArtistProfile extends StatefulWidget {
  final Artist artist;
  const ArtistProfile({super.key, required this.artist});

  @override
  State<ArtistProfile> createState() => _ArtistProfileState();
}

class _ArtistProfileState extends State<ArtistProfile> {
  final nameController = TextEditingController();

  void setavaliation() {}
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
            if (widget.artist.image_url != null)
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: Colors.black, width: 4)),
                  child: Image.network(
                    widget.artist.image_url,
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
            Text(
              widget.artist.username,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 30,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          children: [
            const SizedBox(width: 40),
            Text(
              "Avaliação",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(
              width: 100,
            ),
            Text(
              'Descrição:',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
        Row(
          children: [
            const SizedBox(width: 10),
            RatingBar.builder(
              initialRating: widget.artist.avaliation,
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
            const SizedBox(width: 50),
            Text(
              widget.artist.description,
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 20,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          children: [
            const SizedBox(
              width: 15,
            ),
            MyButton(
                onTap: null,
                text: const Text("Fazer\nproposta"),
                color: Colors.blue[600]),
            const SizedBox(
              width: 15,
            ),
            MyButton(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Avaliation(artist: widget.artist))),
                text: const Text("Avaliar"),
                color: Colors.blue[600]),
          ],
        )
      ]))),
    );
  }
}
