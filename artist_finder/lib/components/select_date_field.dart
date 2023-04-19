import 'package:flutter/material.dart';

class SelectDateField extends StatelessWidget {
  final controller;
  final void Function()? onPressed;
  const SelectDateField(
      {super.key, required this.onPressed, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            fillColor: Colors.grey.shade200,
            filled: true,
            icon: Icon(Icons.calendar_today, color: Colors.grey[500]),
            hintText: 'Data de Nascimento',
            hintStyle: TextStyle(color: Colors.grey[500])),
        readOnly: true,
        onTap: onPressed,
      ),
    );
  }
}
