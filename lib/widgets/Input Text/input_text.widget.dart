import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final String label;
  final Icon icon;
  final Color borderColor;
  final Color borderFocusedColor;
  const InputText({super.key, required this.label, required this.icon, required this.borderColor, required this.borderFocusedColor});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 15),
        hintText: label,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(width: 1),
        ),
        // Borde aplicado cuando el campo está habilitado (enfocado y no enfocado)
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(
              width: 1,
              color: borderColor), // Color del borde en estado habilitado
        ),
        // Borde aplicado cuando el campo está enfocado
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(
              width: 2,
              color:borderFocusedColor), // Ajusta este color según tus necesidades
        ),
        // Borde aplicado cuando el campo tiene un error
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(
              width: 1,
              color: Colors.red), // Color del borde en estado de error
        ),
        suffixIcon:icon,
      ),
    );
  }
}
