import 'package:flutter/material.dart';
import 'url.dart';
import 'package:artist_finder/components/operationdata.dart';

Set<String> _artistsTypetest = {};

// classe onde detem o fundo da página de filtros
class DropdownButtonApp extends StatefulWidget {
  const DropdownButtonApp({super.key});

  @override
  State<DropdownButtonApp> createState() => _DropdownScreenState();
}

// Todos os botões da página de filtragem

class _DropdownScreenState extends State<DropdownButtonApp> {
  List<String> artistsTypetest = [];
  bool isLoading = true;
  bool isLoadingStyle = false;

  @override
  void initState() {
    listTypeArtist();
    super.initState();
  }

  Future listTypeArtist() async {
    artistType = await artistTypeAll();

    for (var elemnt in artistType) {
      _artistsTypetest.add(elemnt.artistType);
    }

    artistsTypetest = List<String>.from(_artistsTypetest);
    print("todo o tipo de artistas $artistsTypetest");

    setState(() {
      isLoading = false;
    });
  }

  List<String> _styles = <String>[];

// these will be the values after selection of the item
  String? artisType;
  String? style;
  //String? state;

// this will help to show the widget after
  bool isTypeSelected = false;

  List<dynamic> searchResults = [];
  List<String> styleResults = [];

  Future listStyle(String query) async {
    styleResults = await searchStyleApi(query);

    setState(() {
      isLoadingStyle = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text("Filter")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //========================Country

            Card(
              color: Colors.grey[300],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: DropdownButton<String>(
                    underline: Container(),
                    hint: Text("Select type of artist"),
                    icon: const Icon(Icons.keyboard_arrow_down),
                    isDense: true,
                    isExpanded: true,
                    items: artistsTypetest
                        .map<DropdownMenuItem<String>>((String ctry) {
                      return DropdownMenuItem<String>(
                          value: ctry, child: Text(ctry));
                    }).toList(),
                    value: artisType,
                    onChanged: (value) {
                      searchResults.clear();
                      listStyle(value.toString());
                      print("teste $styleResults");
                      setState(() {
                        _styles = [];
                        artisType = value!;

                        isTypeSelected = true;
                      });
                    }),
              ),
            ),

//======================================= State
            if (isTypeSelected && isLoadingStyle)
              Card(
                  color: Colors.purple.withOpacity(0.5),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    child: DropdownButton<String>(
                        underline: Container(),
                        hint: Text("Select Style of Artist"),
                        icon: const Icon(Icons.keyboard_arrow_down),
                        isDense: true,
                        isExpanded: true,
                        items: styleResults
                            .map<DropdownMenuItem<String>>((String ctx) {
                          return DropdownMenuItem<String>(
                              value: ctx, child: Text(ctx));
                        }).toList(),
                        value: style,
                        onChanged: (value) {
                          setState(() {
                            style = value!;
                          });
                        }),
                  ))
            else
              Container(),
          ],
        ),
      ),
    );
  }
}
