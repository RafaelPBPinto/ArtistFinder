import 'package:flutter/material.dart';
import 'package:artist_finder/models/Artist.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ArtistProfile extends StatefulWidget {
  final Artist artist;
  const ArtistProfile({super.key, required this.artist});

  @override
  State<ArtistProfile> createState() => _ArtistProfileState();
}

class _ArtistProfileState extends State<ArtistProfile> {
  final nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ArtistFinder"),
        backgroundColor: Colors.grey[700],
        centerTitle: true,
        bottomOpacity: 10,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Center(
                child: Column(children: [
          Row(
            children: [
              if (widget.artist.image_url != null)
                Image.network(
                  widget.artist.image_url,
                  fit: BoxFit.cover,
                  height: 100,
                  width: 100,
                )
              else
                const Icon(
                  Icons.person_2_rounded,
                  size: 100,
                ),
              const SizedBox(width: 30),
              Text(
                widget.artist.username,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
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
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Descricao:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Colors.grey[700],
            ),
          ),
          Text(
            widget.artist.description,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ]))),
      ),
    );
  }
}
