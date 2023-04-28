import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:artist_finder/components/my_button.dart';
import 'package:artist_finder/components/operationdata.dart';
import 'package:artist_finder/models/Artist.dart';

class Avaliation extends StatefulWidget {
  final Artist artist;
  const Avaliation({super.key, required this.artist});

  @override
  State<Avaliation> createState() => _AvaliationState();
}

class _AvaliationState extends State<Avaliation> {
  double artperf = 0;
  double intpub = 0;
  final descController = TextEditingController();
  String comment = '';

  void avaliate() {
    if (artperf == 0 && intpub == 0) {
      showPopUp('Avalie as duas componentes', context);
    } else {
      avaliationfetch(widget.artist, (artperf + intpub) / 2);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Avaliar"),
        backgroundColor: Colors.blue[600],
        centerTitle: true,
        bottomOpacity: 10,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Column(children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              "Performance do artista",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 30,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            RatingBar.builder(
              initialRating: 0,
              minRating: 0,
              maxRating: 5,
              itemSize: 30,
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                artperf = rating;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Interação com o público",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 30,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            RatingBar.builder(
              initialRating: 0,
              minRating: 0,
              maxRating: 5,
              itemSize: 30,
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                intpub = rating;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: descController,
                obscureText: false,
                decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                    ),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    hintText: 'Descreve-te como artista!',
                    hintStyle: TextStyle(color: Colors.grey[500])),
                maxLines: 10,
                onChanged: (String value) {
                  comment = value;
                },
              ),
            ),

            const SizedBox(height: 50),

            // Create Account
            MyButton(
              onTap: avaliate,
              color: Colors.green,
              text: const Text(
                'Submeter',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            )
          ]),
        ),
      )),
    );
  }
}
