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
      );
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
void postUser(Contratant newuser, List<bool> check) async {
  String usertype = '';
  if (check[0]) {
    usertype = '/artists';
  } else if (check[1]) {
    usertype = '/contrs';
  }

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

///
Contratant UserActive(String email, String password) {
  for (Contratant user in contrlist) {
    if (user.email == email && user.password == password) {
      print(user);
      return user;
    }
  }
  return Contratant(username: '', email: '', password: '', data_nasc: '');
}

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
      type: '');
}
