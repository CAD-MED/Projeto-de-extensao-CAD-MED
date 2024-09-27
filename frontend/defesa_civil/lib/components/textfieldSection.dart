import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Para usar TextInputFormatter

Widget textfieldSection(
    {enabled = true,
    IconData icon = Icons.account_box_outlined,
    isNumeric = false,
    required TextInputType keyboardType,
    bool obscureText = false,
    String title = "",
    String hintText = "",
    required TextEditingController controller}) {
  return SizedBox(
      child: Column(children: [
    Align(
        alignment: Alignment.centerLeft,
        child: Text(title,
            style:
                TextStyle(fontSize: 18, color: Colors.black.withOpacity(.8)))),
    const SizedBox(height: 8),
    TextField(
        enabled: enabled,
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        maxLength: isNumeric ? 3 : 256,
        inputFormatters: isNumeric
            ? [FilteringTextInputFormatter.digitsOnly] // Permite apenas números
            : [], // Não aplica filtro se não for numérico
        decoration: InputDecoration(
            prefixIcon: Icon(icon),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            hintText: " $hintText",
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black.withOpacity(.5)),
                borderRadius: BorderRadius.circular(10))))
  ]));
}
