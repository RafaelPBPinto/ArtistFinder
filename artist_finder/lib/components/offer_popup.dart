import 'package:artist_finder/models/ChatMessage.dart';
import 'package:artist_finder/components/operationdata.dart';
import 'package:artist_finder/components/url.dart';
import 'package:artist_finder/models/Artist.dart';
import 'package:flutter/material.dart';

import '../components/select_date_field.dart';
import 'package:artist_finder/components/my_button.dart';

class OfferPopUp extends StatefulWidget {
  const OfferPopUp({super.key});

  @override
  State<OfferPopUp> createState() => _OfferPopUpState();
}

class _OfferPopUpState extends State<OfferPopUp> {
  TimeOfDay _time = TimeOfDay(hour: 7, minute: 15);
  final dateController = TextEditingController();
  final descController = TextEditingController();
  String details = '';
  String data_nasc = '';
  String hours = '';
  double price = 0;
  void _selectTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (newTime != null) {
      setState(() {
        _time = newTime;
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    //proposalfetch(widget.artist.id);

    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900, 1),
        lastDate: DateTime(2050));
    if (picked != null && picked != DateTime.now()) {
      setState(() {
        // convert date to string
        data_nasc =
            "${picked.year.toString()}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
        dateController.text = data_nasc;
      });
    }
  }

  void makeproposal() {
    ChatMessage message;

    //proposalpost(details, widget.artist.id, activecontratant.id, price,
    //  data_nasc, _time.format(context));
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: const Text('Fazer proposta'),
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 20),
              SelectDateField(
                controller: dateController,
                onPressed: () => _selectDate(context),
                text: 'Data',
              ),
              const SizedBox(
                height: 20,
              ),
              Text("Hora selecionada : ${_time.format(context)}"),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: _selectTime, child: const Text("Alterar Hora")),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                    labelText: 'Quantia', icon: Icon(Icons.euro)),
                onChanged: (value) {
                  price = double.parse(value);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: descController,
                decoration: const InputDecoration(
                  labelText: 'Descrição (opcional)',
                  icon: Icon(Icons.message),
                ),
              ),
              const SizedBox(height: 30),
              MyButton(
                onTap: makeproposal,
                color: Colors.green,
                text: const Text(
                  'Submeter',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
