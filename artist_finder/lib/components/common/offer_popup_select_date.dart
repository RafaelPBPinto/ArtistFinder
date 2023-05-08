import 'package:flutter/material.dart';

class OfferSelectDateField extends StatelessWidget {
  final controller;
  final void Function()? onPressed;
  final String text;
  const OfferSelectDateField(
      {super.key,
      required this.onPressed,
      required this.controller,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return TextField(
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
          hintText: text,
          hintStyle: TextStyle(color: Colors.grey[500])),
      readOnly: true,
      onTap: onPressed,
    );
  }
}
