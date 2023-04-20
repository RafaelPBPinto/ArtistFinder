import 'package:artist_finder/models/Contratant.dart';
import 'package:artist_finder/models/Artist.dart';

/// String with a server link
const String api = 'http://localhost:8000';

/// List to save all contratant users , global variable
List<Contratant> contrlist = [];

/// List to save all artist users, global variable
List<Artist> artlist = [];

///User at the moment
Contratant activecontratant =
    Contratant(data_nasc: '', username: '', password: '', email: '');

/// Artist at the moment
Artist activeartist = Artist(
    avaliation: 0.0,
    email: '',
    username: '',
    password: '',
    data_nasc: '',
    type: '');
