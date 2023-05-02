import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class EditContrProfile extends StatefulWidget {
  const EditContrProfile({super.key});

  @override
  State<EditContrProfile> createState() => _EditContrProfileState();
}

class _EditContrProfileState extends State<EditContrProfile> {
  String? _email = '';
  String _password = '';
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
                child: Center(
                    child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Email'),
              onChanged: (value) {
                _email = value;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Palavra passe'),
              onChanged: (value) {
                _password = value;
              },
            ),
          ],
        )))));
  }
}
