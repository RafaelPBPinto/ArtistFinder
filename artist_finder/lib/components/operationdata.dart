import 'package:flutter/material.dart';
import 'package:artist_finder/models/User.dart';
import 'url.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void fetchUsers() async {
  try {
    http.Response response = await http.get(Uri.parse(api));
    var data = json.decode(response.body);

    data.forEach((user) {
      User newuser = User(
          username: user['username'],
          email: user['email'],
          password: user['password'],
          data_nasc: user['data_nasc']);

      userlist.add(newuser);
    });
  } catch (e) {
    print(e);
  }
}

bool checkuser(String email, String password) {
  bool check = false;

  for (var element in userlist) {
    if (element.email == email && element.password == password) {
      check = true;
      break;
    } else {
      check = false;
    }
  }
  print(check);
  return check;
}

void postUser(User newuser) async {
  try {
    http.Response response = await http.post(Uri.parse(api),
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
