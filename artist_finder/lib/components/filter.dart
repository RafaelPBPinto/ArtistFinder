import 'package:artist_finder/components/my_button.dart';
import 'package:flutter/material.dart';
import 'url.dart';
import 'package:artist_finder/components/operationdata.dart';
import 'package:artist_finder/pages/contr_page_filtered.dart';

Set<String> _artistsTypetest = {};

// classe onde detem o fundo da página de filtros
class DropdownButtonApp extends StatefulWidget {
  const DropdownButtonApp({super.key});

  @override
  State<DropdownButtonApp> createState() => _DropdownScreenState();
}

// Todos os botões da página de filtragem

class _DropdownScreenState extends State<DropdownButtonApp> {
  List<String> types = [];
  bool isLoading = true;
  bool isLoadingStyle = false;
  void filter() {
    if (artisType == null) {
      showPopUp("Incompleto", "Escolha um filtro antes de filtrar", context);
    } else if (style == null) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: ((context) =>
                  ContrPageFiltered(type: artisType.toString()))));
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: ((context) => ContrPageFiltered(
                    type: artisType,
                    style: style,
                  ))));
    }
  }

  @override
  void initState() {
    super.initState();
    for (String element in logintypestyle.keys) {
      types.add(element);
    }
  }

  List<String> _styles = <String>[];

// these will be the values after selection of the item
  String? artisType;
  String? style;
  //String? state;

// this will help to show the widget after
  bool isTypeSelected = false;

  List<dynamic> searchResults = [];
  List<String>? styleResults = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Filtros")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
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
                    hint: const Text("Selecione tipo de artista"),
                    icon: const Icon(Icons.keyboard_arrow_down),
                    isDense: true,
                    isExpanded: true,
                    items: types.map((String value) {
                      return DropdownMenuItem<String>(
                          value: value, child: Text(value));
                    }).toList(),
                    value: artisType,
                    onChanged: (value) {
                      setState(() {
                        artisType = value;
                        styleResults = logintypestyle[artisType];

                        isTypeSelected = true;
                      });
                    }),
              ),
            ),

//======================================= State
            if (isTypeSelected)
              Card(
                  color: Colors.grey[300],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    child: DropdownButton<String>(
                        underline: Container(),
                        hint: const Text("Select Style of Artist"),
                        icon: const Icon(Icons.keyboard_arrow_down),
                        isDense: true,
                        isExpanded: true,
                        items: styleResults?.map((String ctx) {
                          return DropdownMenuItem<String>(
                              value: ctx, child: Text(ctx));
                        }).toList(),
                        value: style,
                        onChanged: (value) {
                          setState(() {
                            style = value;
                          });
                        }),
                  ))
            else
              Container(),

            const SizedBox(
              height: 30,
            ),
            MyButton(
                onTap: filter,
                text: const Text("Filtrar"),
                color: isTypeSelected ? Colors.green : Colors.grey)
          ],
        ),
      ),
    );
  }
}
