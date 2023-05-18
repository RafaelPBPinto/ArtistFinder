import 'package:artist_finder/models/ChatMessage.dart';
import 'package:artist_finder/models/Contratant.dart';
import 'package:flutter/material.dart';
import 'package:artist_finder/pages/artist/negotiation_artist.dart';

import 'package:artist_finder/components/common/offer_popup_select_date.dart';

class OfferPopUpArtist extends StatefulWidget {
  Contratant contratant;
  OfferPopUpArtist({super.key, required this.contratant});

  @override
  State<OfferPopUpArtist> createState() => _OfferPopUpArtistState();
}

class _OfferPopUpArtistState extends State<OfferPopUpArtist> {
  TimeOfDay _duration = TimeOfDay(hour: 1, minute: 0);
  TimeOfDay _time = TimeOfDay(hour: 7, minute: 15);
  final dateController = TextEditingController();
  final descController = TextEditingController();
  String details = '';
  String data_nasc = '';
  String hours = '';
  String duration = '';
  double price = 0;
  void _selectTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (newTime != null) {
      setState(() {
        _time = newTime;
        hours = _time.format(context);
      });
    }
  }

  void _selectDuration() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _duration,
    );
    if (newTime != null) {
      setState(() {
        _duration = newTime;
        duration = _duration.format(context);
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
            "${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year.toString()}";
        dateController.text = data_nasc;
      });
    }
  }

  void makeproposal() {
    String name = widget.contratant.username;
    String date = dateController.text;
    String desc = descController.text;

    if (descController.text.isEmpty) {
      demoChatMessages.add(ChatMessage(
          id_artista: 99999,
          id_contratante: widget.contratant.id,
          text:
              "Propuseste a $name:\n$price\nDia: $date\nHora: $hours\nDuracao: $duration h",
          messageType: ChatMessageType.offer,
          messageStatus: MessageStatus.viewed,
          offerStatus: OfferStatus.pending,
          isSender: true));
    } else {
      demoChatMessages.add(ChatMessage(
          id_artista: 99999,
          id_contratante: widget.contratant.id,
          text:
              "Propuseste a $name:\n$price€\nDia: $date\nHora: $hours\nDuracao: $duration h\nDescrição:\n$desc",
          messageType: ChatMessageType.offer,
          messageStatus: MessageStatus.viewed,
          offerStatus: OfferStatus.pending,
          isSender: true));
    }

    // refresh the chat screen
    // refresh the chat screen
    Navigator.of(context).pop();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => NegotiationArtistPage(
                  contratant: widget.contratant,
                )));

    /*proposalpost(details, widget.artist.id, activecontratant.id, price,
        data_nasc, _time.format(context));*/
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
              const SizedBox(
                height: 20,
              ),
              OfferSelectDateField(
                controller: dateController,
                onPressed: () => _selectDate(context),
                text: 'Data',
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Icon(
                    Icons.access_time,
                    color: Colors.grey[500],
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    "Hora: ${_time.format(context)}",
                    style: TextStyle(color: Colors.grey[500]),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: _selectTime, child: const Text("Alterar")),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Icon(
                    Icons.alarm,
                    color: Colors.grey[500],
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    "Duração: ${_duration.format(context)}h",
                    style: TextStyle(color: Colors.grey[500]),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: _selectDuration, child: const Text("Alterar")),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                    labelText: 'Quantia',
                    icon: Icon(
                      Icons.euro,
                      color: Colors.grey[500],
                    )),
                style: TextStyle(color: Colors.grey[500]),
                onChanged: (value) {
                  price = double.parse(value);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: descController,
                decoration: InputDecoration(
                  labelText: 'Descrição (opcional)',
                  icon: Icon(
                    Icons.message,
                    color: Colors.grey[500],
                  ),
                ),
                style: TextStyle(color: Colors.grey[500]),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.pop(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey[500],
          ),
          child: const Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: () => makeproposal(),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
          ),
          child: const Text('Submeter'),
        ),
      ],
    );
  }
}
