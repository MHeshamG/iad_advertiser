import 'package:flutter/material.dart';

class TextInputWidget extends StatelessWidget {
  TextEditingController controller;
  String label;
  IconData icon;
  bool Function(String input) validator;
  bool obscure;

  TextInputWidget(this.controller, this.label, this.icon, this.validator, this .obscure);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(
            labelText: label,
            prefixIcon: Icon(icon),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.pink, width: 2))),
        validator: (input) => validator(input) ? label + " is not valid" : null,
      ),
    );
  }
}
