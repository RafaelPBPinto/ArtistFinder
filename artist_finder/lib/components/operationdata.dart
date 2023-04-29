import 'package:artist_finder/models/Contratant.dart';
import 'package:flutter/material.dart';
import 'url.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:artist_finder/models/Artist.dart';

/// Function to fecth all users from the api, artist and contratants
void fetchUsers(BuildContext context) async {
  // Fetch Artist users and store in artlist
  try {
    http.Response response = await http.get(Uri.parse('$api/artists'));
    var data = json.decode(response.body);
    artlist = [];
    data.forEach((user) {
      Artist newuser = Artist(
          id: user['id'],
          username: user['username'],
          email: user['email'],
          password: user['password'],
          data_nasc: user['data_nasc'],
          type: user['type'],
          avaliation: user['avaliation'],
          locality: user['locality'],
          description: user['description'],
          image_url: user['image_url'],
          no_avaliations: user['no_avaliations']);
      artlist.add(newuser);
    });
    print(artlist);
  } catch (e) {
    print(e);
    showPopUp('Cant connect to server : $e', context);
  }

  // Fetch Contratant users and store in contrlist
  try {
    http.Response response = await http.get(Uri.parse('$api/contrs'));
    var data = json.decode(response.body);
    contrlist = [];
    data.forEach((user) {
      Contratant newuser = Contratant(
          id: user['id'],
          username: user['username'],
          email: user['email'],
          password: user['password'],
          data_nasc: user['data_nasc']);

      contrlist.add(newuser);
    });
    // ignore: empty_catches
  } catch (e) {}

  try {
    http.Response response = await http.get(Uri.parse('$api/comments'));
    var data = json.decode(response.body);
    comments = {};
    data.forEach((comment) {
      if (comments.containsKey(comment['id_artist'])) {
        comments[comment['id_artist']]!
            .addAll({comment['id_contr']: comment['comment']});
      } else {
        comments[comment['id_artist']] = {
          comment['id_contr']: comment['comment']
        };
      }
    });
    print(response.body);
    print(comments);
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

    // ignore: empty_catches
  } catch (e) {}
}

Future<void> postArtist(Artist newuser) async {
  String usertype = '/artists';

  var request = await http.MultipartRequest('POST', Uri.parse(api + usertype));
  request.fields["username"] = newuser.username;
  request.fields["email"] = newuser.email;
  request.fields["password"] = newuser.password;
  request.fields["data_nasc"] = newuser.data_nasc;
  request.fields["locality"] = newuser.locality;
  request.fields["avaliation"] = newuser.avaliation.toString();
  request.fields["type"] = newuser.type;
  request.fields["description"] = newuser.description;
  request.files
      .add(await http.MultipartFile.fromPath("image_url", newuser.image_url));

  await request.send();
}

/// Located in operationdata.dart . Function to receive email and password and return the Contratant respectvely to that email
/// and that pass
Contratant UserActive(String email, String password) {
  for (Contratant user in contrlist) {
    if (user.email == email && user.password == password) {
      return user;
    }
  }
  return Contratant(
      id: 0, username: '', email: '', password: '', data_nasc: '');
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
      id: 0,
      username: '',
      email: '',
      password: '',
      data_nasc: '',
      avaliation: 0,
      type: '',
      locality: '',
      description: '',
      image_url: null,
      no_avaliations: 0);
}

/// Located in operationdata.dart . Function to receive the username and return the Artist respectvely to that user
Artist ArtistByUsername(String username) {
  for (Artist user in artlist) {
    if (user.username == username) {
      return user;
    }
  }
  return Artist(
      id: 0,
      username: '',
      email: '',
      password: '',
      data_nasc: '',
      avaliation: 0,
      type: '',
      locality: '',
      description: '',
      image_url: null,
      no_avaliations: 0);
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

void avaliationfetch(Artist artist, double avaliation) async {
  String usertype = '/artists/${artist.id}';
  int newnumber = artist.no_avaliations + 1;

  try {
    http.Response response = await http.put(Uri.parse(api + usertype),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode(<String, dynamic>{
          "username": artist.username,
          "email": artist.email,
          "data_nasc": artist.data_nasc,
          "password": artist.password,
          "no_avaliations": newnumber,
          "avaliation": (((newnumber - 1) * artist.avaliation) + avaliation) /
              (newnumber),
        }));
    print(response.body);

    // ignore: empty_catches
  } catch (e) {
    print(e);
  }
}

void commentfecth(String comment, int artistid, int contrid) async {
  String usertype = '/comments';
  try {
    http.Response response = await http.post(Uri.parse(api + usertype),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode(<String, dynamic>{
          "comment": comment,
          "id_contr": contrid,
          "id_artist": artistid,
        }));
    print(response.body);
  } catch (e) {
    print(e);
  }
}
