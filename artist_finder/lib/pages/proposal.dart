import 'package:artist_finder/models/Artist.dart';
import 'package:flutter/material.dart';

import '../components/select_date_field.dart';
import 'package:artist_finder/components/my_button.dart';

class Proposal extends StatefulWidget {
  final Artist artist;
  const Proposal({super.key, required this.artist});

  @override
  State<Proposal> createState() => _ProposalState();
}

class _ProposalState extends State<Proposal> {
  TimeOfDay _time = TimeOfDay(hour: 7, minute: 15);
  final dateController = TextEditingController();
  final descController = TextEditingController();
  String comment = '';

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
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900, 1),
        lastDate: DateTime(2050));
    if (picked != null && picked != DateTime.now()) {
      setState(() {
        // convert date to string
        //newuser.data_nasc =
        //    "${picked.year.toString()}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
        //dateController.text = newuser.data_nasc;
      });
    }
  }

  void makeproposal() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fazer Proposta"),
        backgroundColor: Colors.blue[600],
        centerTitle: true,
        bottomOpacity: 10,
        actions: const [
          IconButton(
              onPressed: null,
              icon: Icon(
                Icons.message,
                color: Colors.white,
              ))
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
            child: Column(
          children: [
            SelectDateField(
                controller: dateController,
                onPressed: () => _selectDate(context)),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: _selectTime, child: const Text("Select Time")),
            const SizedBox(
              height: 20,
            ),
            Text("Selected Time : ${_time.format(context)}"),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: descController,
                obscureText: false,
                decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                    ),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    hintText: 'Deixa aqui a tua opiniao!',
                    hintStyle: TextStyle(color: Colors.grey[500])),
                maxLines: 10,
                onChanged: (String value) {
                  comment = value;
                  print(comment);
                },
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
        )),
      )),
    );
  }
}
