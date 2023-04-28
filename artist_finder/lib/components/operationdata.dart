import 'package:artist_finder/models/Contratant.dart';
import 'package:flutter/material.dart';
import 'url.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:artist_finder/models/Artist.dart';

/// Function to fecth all users from the api, artist and contratants
void fetchUsers() async {
  // Fetch Artist users and store in artlist
  try {
    http.Response response = await http.get(Uri.parse('$api/artists'));
    var data = json.decode(response.body);
    artlist = [];
    data.forEach((user) {
      Artist newuser = Artist(
          username: user['username'],
          email: user['email'],
          password: user['password'],
          data_nasc: user['data_nasc'],
          type: user['type'],
          avaliation: user['avaliation'],
          locality: user['locality'],
          description: user['description'],
          image_url: user['image_url']);
      artlist.add(newuser);
    });
  } catch (e) {
    print(e);
  }

  // Fetch Contratant users and store in contrlist
  try {
    http.Response response = await http.get(Uri.parse('$api/contrs'));
    var data = json.decode(response.body);
    contrlist = [];
    data.forEach((user) {
      Contratant newuser = Contratant(
          username: user['username'],
          email: user['email'],
          password: user['password'],
          data_nasc: user['data_nasc']);

      contrlist.add(newuser);
    });
  } catch (e) {
    print(e);
  }
}

/// Function to verify if the login input is correct
/// Verify if user input exists
/// Return {'Artist' : true,'Contratant' : false} if the user exists and if he is an artist
/// Return {'Artist' : false,'Contratant' : true} if the user exists and if he is a contratant
/// Return {'Artist' : false,'Contratant' : false} if the user does not exist
Map<String, bool> checkuser(String email, String password) {
  Map<String, bool> check = {};

  for (var element in artlist) {
    if (element.email == email && element.password == password) {
      check['Artist'] = true;
      break;
    } else {
      check['Artist'] = false;
    }
  }

  for (var element in contrlist) {
    if (element.email == email && element.password == password) {
      check['Contratant'] = true;
      break;
    } else {
      check['Contratant'] = false;
    }
  }
  print(check);
  return check;
}

/// Function to post a user in the server when he creates a new account
/// Verify if is an artist or a contratant to post in a right place
void postContratant(Contratant newuser) async {
  String usertype = '/contrs';

  try {
    http.Response response = await http.post(Uri.parse(api + usertype),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode(<String, dynamic>{
          "username": newuser.username,
          "email": newuser.email,
          "password": newuser.password,
          "data_nasc": newuser.data_nasc
        }));

    print(response.body);
  } catch (e) {
    print(e);
  }
}

void postArtist(Artist newuser) async {
  String usertype = '/contrs';

  try {
    http.Response response = await http.post(Uri.parse(api + usertype),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode(
          <String, dynamic>{
            "username": newuser.username,
            "email": newuser.email,
            "password": newuser.password,
            "data_nasc": newuser.data_nasc,
            "locality": newuser.locality,
            "avaliation": newuser.avaliation,
            "type": newuser.type,
            "description": newuser.description,
            "image_url": newuser.image_url
          },
        ));

    print("Response. body ${response.body}");
  } catch (e) {
    print("error: $e");
  }
}

/// Located in operationdata.dart . Function to receive email and password and return the Contratant respectvely to that email
/// and that pass
Contratant UserActive(String email, String password) {
  for (Contratant user in contrlist) {
    if (user.email == email && user.password == password) {
      print(user);
      return user;
    }
  }
  return Contratant(username: '', email: '', password: '', data_nasc: '');
}

/// Located in operationdata.dart . Function to receive email and password and return the Artist respectvely to that email
/// and that pass
Artist ArtistActive(String email, String password) {
  for (Artist user in artlist) {
    if (user.email == email && user.password == password) {
      return user;
    }
  }
  return Artist(
      username: '',
      email: '',
      password: '',
      data_nasc: '',
      avaliation: 0,
      type: '',
      locality: '',
      description: '',
      image_url: null);
}

/// Located in operationdata.dart . Function to receive the username and return the Artist respectvely to that user
Artist ArtistByUsername(String username) {
  for (Artist user in artlist) {
    if (user.username == username) {
      return user;
    }
  }
  return Artist(
      username: '',
      email: '',
      password: '',
      data_nasc: '',
      avaliation: 0,
      type: '',
      locality: '',
      description: '',
      image_url: null);
}

bool checkArtistUsername(String username) {
  for (Artist artist in artlist) {
    if (artist.username == username) {
      return false;
    }
  }
  return true;
}

bool checkContratantUsername(String username) {
  for (Contratant contr in contrlist) {
    if (contr.username == username) {
      return false;
    }
  }
  return true;
}

void showPopUp(String string, BuildContext contextprinc) {
  showDialog(
      context: contextprinc,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Incompleto'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(string),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Voltar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      });
}
