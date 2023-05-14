import 'package:artist_finder/components/common/my_button.dart';
import 'package:flutter/material.dart';
import '../common/url.dart';
import 'package:artist_finder/components/common/operationdata.dart';
import 'package:artist_finder/pages/contratant/contr_page_filtered.dart';

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
            const SizedBox(
              height: 15,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.grey[400]),
              child: DropdownButton<String>(
                  underline: Container(),
                  alignment: Alignment.center,
                  hint: const Text("Selecione o tipo de artista"),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: types.map((String value) {
                    return DropdownMenuItem<String>(
                        value: value, child: Text(value));
                  }).toList(),
                  value: artisType,
                  onChanged: (value) {
                    setState(() {
                      artisType = value;
                      styleResults = logintypestyle[artisType];
                      if (style != null) {
                        style = null;
                      }
                      print(styleResults);
                      isTypeSelected = true;
                    });
                  }),
            ),
            const SizedBox(
              height: 30,
            ),
            if (isTypeSelected)
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.grey[400]),
                child: DropdownButton<String>(
                    underline: Container(),
                    alignment: Alignment.center,
                    hint: const Text("Selecione o estilo de artista"),
                    icon: const Icon(Icons.keyboard_arrow_down),
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
              )
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
