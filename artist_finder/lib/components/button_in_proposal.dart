import 'package:flutter/material.dart';

class ButtonInProposal extends StatelessWidget {
  final Function() func;
  final Text text;
  final Color color;
  const ButtonInProposal(
      {super.key, required this.func, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100,
        height: 50,
        child: ElevatedButton(
          onPressed: func,
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(color),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
              textStyle: MaterialStateProperty.all<TextStyle>(
                const TextStyle(fontSize: 13.0, fontWeight: FontWeight.normal),
              ),
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
              )),
          child: text,
        ));
  }
}
