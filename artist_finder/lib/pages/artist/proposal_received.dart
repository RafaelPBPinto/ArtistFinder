import 'package:artist_finder/components/common/operationdata.dart';
import 'package:artist_finder/components/common/url.dart';
import 'package:flutter/material.dart';
import 'ace_neg_dec.dart';

class ProposalReceived extends StatefulWidget {
  const ProposalReceived({super.key});

  @override
  State<ProposalReceived> createState() => _ProposalReceivedState();
}

class _ProposalReceivedState extends State<ProposalReceived> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        title: const Text('Propostas recebidas'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
            child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            if (proposlist.isNotEmpty)
              ListView.separated(
                separatorBuilder: (context, index) {
                  return const Divider(height: 10);
                },
                shrinkWrap: true,
                itemCount: proposlist.length,
                itemBuilder: (BuildContext context, index) {
                  final proposal = proposlist[index];
                  return ListTile(
                    title: Text(ContratantById(proposal.contrid)),
                    subtitle: Text(
                        "Dia: ${proposal.date} , Hora: ${proposal.hours} , Preço: ${proposal.price} euros"),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AcceNegDec(
                                  propos: proposal,
                                  contratant: getContrant(proposal.contrid),
                                ))),
                  );
                },
              ),
            if (proposlist.isEmpty)
              Column(children: [
                const Icon(
                  Icons.mood_bad,
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Lamentamos ${activeartist.username}\nAinda sem propostas!\nVolte mais tarde',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.grey[700],
                  ),
                ),
              ]),
          ],
        )),
      )),
    );
  }
}
