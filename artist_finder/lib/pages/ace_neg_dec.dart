import 'package:artist_finder/pages/artist_page.dart';
import 'package:flutter/material.dart';
import 'package:artist_finder/models/Proposal.dart';
import 'package:artist_finder/components/operationdata.dart';
import 'package:artist_finder/components/button_in_proposal.dart';
import 'negotiation.dart';
import 'package:artist_finder/components/url.dart';

class AcceNegDec extends StatefulWidget {
  final Proposal propos;
  const AcceNegDec({super.key, required this.propos});

  @override
  State<AcceNegDec> createState() => _AcceNegDecState();
}

class _AcceNegDecState extends State<AcceNegDec> {
  void acceptproposal() {
    putproposal(widget.propos);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("Proposta aceite com sucesso"),
      backgroundColor: Colors.black,
      duration: Duration(seconds: 2),
    ));
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ArtistPage()));
  }

  void negotiateproposal() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => NegotiationPage(artist: activeartist)));
  }

  void declineproposal() {
    deleteproposal(widget.propos);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("Proposta rejeitada com sucesso"),
      backgroundColor: Colors.black,
      duration: Duration(seconds: 2),
    ));
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ArtistPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        title: Text('Proposta de ${ContratantById(widget.propos.contrid)}'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Center(
          child: Column(children: [
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Dia proposto",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              widget.propos.date,
              style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              thickness: 2.5,
              color: Colors.blue,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Hora proposta",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              widget.propos.hours,
              style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              thickness: 2.5,
              color: Colors.blue,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Preço proposto",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              '${widget.propos.price} euros',
              style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 20,
            ),
            if (widget.propos.details != '')
              Column(
                children: [
                  const Divider(
                    thickness: 2.5,
                    color: Colors.blue,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Detalhes sobre a proposta",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    widget.propos.details,
                    style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              thickness: 2.5,
              color: Colors.blue,
            ),
            const SizedBox(
              height: 20,
            ),
            if (!widget.propos.isAccepted)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonInProposal(
                    func: acceptproposal,
                    text: const Text("Aceitar"),
                    color: Colors.green,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  ButtonInProposal(
                    func: negotiateproposal,
                    text: const Text("Negociar"),
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  ButtonInProposal(
                    func: declineproposal,
                    text: const Text("Rejeitar"),
                    color: Colors.red,
                  ),
                ],
              ),
            if (widget.propos.isAccepted)
              const Text(
                "Proposta já aceitada",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
          ]),
        )),
      ),
    );
  }
}
