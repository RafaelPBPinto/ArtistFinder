import 'package:artist_finder/models/Contratant.dart';
import 'package:artist_finder/models/Artist.dart';
import 'package:artist_finder/models/Proposal.dart';
import 'package:artist_finder/models/ArtistType.dart';


/// String with a server link
const String api = 'http://localhost:8000';

/// List to save all contratant users , global variable
List<Contratant> contrlist = [];

/// List to save all artist users, global variable
List<Artist> artlist = [];

/// Store the comments with artists id as key and its comments with a map with contratant id as key and comment as String
Map<int, Map<int, String>> comments = {};

///User at the moment
Contratant activecontratant =
    Contratant(id: 0, data_nasc: '', username: '', password: '', email: '');

/// Artist at the moment
Artist activeartist = Artist(
    id: 0,
    avaliation: 0.0,
    email: '',
    username: '',
    password: '',
    data_nasc: '',
    type: '',
    locality: '',
    description: '',
    image_url: null,
    no_avaliations: 0);

List<Proposal> proposlist = [];

final Map<String, List<String>> cities = {
  '': [''],
  'Aveiro': [
    'Águeda',
    'Albergaria-a-Velha',
    'Anadia',
    'Arouca',
    'Aveiro',
    'Castelo de Paiva',
    'Estarreja',
    'Espinho',
    'Ílhavo',
    'Mealhada',
    'Murtosa',
    'Oliveira de Azeméis',
    'Oliveira do Bairro',
    'São João da Madeira',
    'Santa Maria da Feira',
    'Sever do Vouga',
    'Vagos',
    'Vale de Cambra',
  ],
  'Beja': [
    'Aljustrel',
    'Almodôvar',
    'Alvito',
    'Barrancos',
    'Beja',
    'Castro Verde',
    'Cuba',
    'Ferreira do Alentejo',
    'Mértola',
    'Moura',
    'Odemira',
    'Ourique',
    'Serpa',
    'Vidigueira'
  ],
  'Braga': [
    'Amares',
    'Barcelos',
    'Braga',
    'Cabeceiras de Basto',
    'Celorico de Basto',
    'Esposende',
    'Fafe',
    'Guimarães',
    'Póvoa de Lanhoso',
    'Terras de Bouro',
    'Vieira do Minho',
    'Vila Nova de Famalicão',
    'Vila Verde',
    'Vizela'
  ],
  'Bragança': [
    'Alfândega da Fé',
    'Bragança',
    'Carrazeda de Ansiães',
    'Freixo de Espada à Cinta',
    'Macedo de Cavaleiros',
    'Miranda do Douro',
    'Mirandela',
    'Mogadouro',
    'Torre de Moncorvo',
    'Vila Flor',
    'Vimioso',
    'Vinhais',
  ],
  'Castelo Branco': [
    'Belmonte',
    'Castelo Branco',
    'Covilhã',
    'Fundão',
    'Idanha-a-Nova',
    'Oleiros',
    'Penamacor',
    'Proença-a-Nova',
    'Sertã',
    'Vila de Rei',
    'Vila Velha de Ródão',
  ],
  'Coimbra': [
    'Arganil',
    'Cantanhede',
    'Coimbra',
    'Condeixa-a-Nova',
    'Figueira da Foz',
    'Góis',
    'Lousã',
    'Mira',
    'Miranda do Corvo',
    'Montemor-o-Velho',
    'Oliveira do Hospital',
    'Pampilhosa da Serra',
    'Penacova',
    'Penela',
    'Soure',
    'Tábua',
    'Vila Nova de Poiares',
  ],
  'Évora': [
    'Alandroal',
    'Arraiolos',
    'Borba',
    'Estremoz',
    'Évora',
    'Montemor-o-Novo',
    'Mora',
    'Mourão',
    'Portel',
    'Redondo',
    'Reguengos de Monsaraz',
    'Vendas Novas',
    'Viana do Alentejo',
    'Vila Viçosa',
  ],
  'Faro': [
    'Albufeira',
    'Alcoutim',
    'Aljezur',
    'Castro Marim',
    'Faro',
    'Lagoa',
    'Lagos',
    'Loulé',
    'Monchique',
    'Olhão',
    'Portimão',
    'São Brás de Alportel',
    'Silves',
    'Tavira',
    'Vila do Bispo',
    'Vila Real de Santo António',
  ],
  'Guarda': [
    'Aguiar da Beira',
    'Almeida',
    'Celorico da Beira',
    'Figueira de Castelo Rodrigo',
    'Fornos de Algodres',
    'Gouveia',
    'Guarda',
    'Manteigas',
    'Mêda',
    'Pinhel',
    'Sabugal',
    'Seia',
    'Trancoso',
    'Vila Nova de Foz Côa',
  ],
  'Leiria': [
    'Alcobaça',
    'Alvaiázere',
    'Ansião',
    'Batalha',
    'Bombarral',
    'Caldas da Rainha',
    'Castanheira de Pêra',
    'Figueiró dos Vinhos',
    'Leiria',
    'Marinha Grande',
    'Nazaré',
    'Óbidos',
    'Pedrógão Grande',
    'Peniche',
    'Pombal',
    'Porto de Mós',
  ],
  'Lisboa': [
    'Alenquer',
    'Amadora',
    'Arruda dos Vinhos',
    'Azambuja',
    'Cadaval',
    'Cascais',
    'Lisboa',
    'Loures',
    'Lourinhã',
    'Mafra',
    'Odivelas',
    'Oeiras',
    'Sintra',
    'Sobral de Monte Agraço',
    'Torres Vedras',
    'Vila Franca de Xira',
  ],
  'Portalegre': [
    'Alter do Chão',
    'Arronches',
    'Avis',
    'Campo Maior',
    'Castelo de Vide',
    'Crato',
    'Elvas',
    'Fronteira',
    'Gavião',
    'Marvão',
    'Monforte',
    'Nisa',
    'Ponte de Sor',
    'Portalegre',
    'Sousel',
  ],
  'Porto': [
    'Amarante',
    'Baião',
    'Felgueiras',
    'Gondomar',
    'Lousada',
    'Maia',
    'Marco de Canaveses',
    'Matosinhos',
    'Paços de Ferreira',
    'Paredes',
    'Penafiel',
    'Porto',
    'Póvoa de Varzim',
    'Santo Tirso',
    'Valongo',
    'Vila do Conde',
    'Vila Nova de Gaia',
  ],
  'Santarém': [
    'Abrantes',
    'Alcanena',
    'Almeirim',
    'Alpiarça',
    'Benavente',
    'Cartaxo',
    'Chamusca',
    'Constância',
    'Coruche',
    'Entroncamento',
    'Ferreira do Zêzere',
    'Golegã',
    'Mação',
    'Ourém',
    'Rio Maior',
    'Salvaterra de Magos',
    'Santarém',
    'Sardoal',
    'Tomar',
    'Torres Novas',
    'Vila Nova da Barquinha',
  ],
  'Setúbal': [
    'Alcácer do Sal',
    'Alcochete',
    'Almada',
    'Barreiro',
    'Grândola',
    'Moita',
    'Montijo',
    'Palmela',
    'Santiago do Cacém',
    'Seixal',
    'Sesimbra',
    'Setúbal',
    'Sines',
  ],
  'Viana do Castelo': [
    'Arcos de Valdevez',
    'Caminha',
    'Melgaço',
    'Monção',
    'Paredes de Coura',
    'Ponte da Barca',
    'Ponte de Lima',
    'Valença',
    'Viana do Castelo',
    'Vila Nova de Cerveira',
  ],
  'Vila Real': [
    'Alijó',
    'Boticas',
    'Chaves',
    'Mesão Frio',
    'Mondim de Basto',
    'Montalegre',
    'Murça',
    'Peso da Régua',
    'Ribeira de Pena',
    'Sabrosa',
    'Santa Marta de Penaguião',
    'Valpaços',
    'Vila Pouca de Aguiar',
    'Vila Real',
  ],
  'Viseu': [
    'Armamar',
    'Carregal do Sal',
    'Castro Daire',
    'Cinfães',
    'Lamego',
    'Mangualde',
    'Moimenta da Beira',
    'Mortágua',
    'Nelas',
    'Oliveira de Frades',
    'Penalva do Castelo',
    'Penedono',
    'Resende',
    'Santa Comba Dão',
    'São João da Pesqueira',
    'Sátão',
    'Sernancelhe',
    'Tabuaço',
    'Tarouca',
    'Tondela',
    'Vila Nova de Paiva',
    'Viseu',
    'Vouzela',
  ],
};


/// List to save all artist users, global variable

List<ArtistType> artistType = [];

List<String> filterStyles = [];