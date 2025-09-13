import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final bool obscureText;
  final String? Function(String?)? validator;

  const TextFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    required this.icon,
    this.obscureText = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(0, 3)),
        ],
      ),
      child: TextFormField(
        controller: controller,
        style: TextStyle(fontFamily: "rocket", color: Color(0xFF6C3483)),
        cursorColor: Color(0xFF9B59B6),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Color(0xFFD39AD3), // morado oscuro para que contraste con rosa
            fontFamily: "rocket",
          ),
          prefixIcon: Icon(icon, color: Color(0xFF9B59B6)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide.none,
          ),
          filled: false, // ya está el fondo en el Container
          errorStyle: TextStyle(
            fontFamily: "rocket",
            color: Color(0xFFE27AA2),
            fontWeight: FontWeight.bold,
          ),
        ),
        obscureText: obscureText,
        validator: validator,
      ),
    );
  }
}
