import 'dart:io' show File;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pmsn20252/screens/login_screen.dart';
import 'package:pmsn20252/utils/text_field_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _conName = TextEditingController();
  final TextEditingController _conEmail = TextEditingController();
  final TextEditingController _conPwd = TextEditingController();
  final TextEditingController _conConf = TextEditingController();

  File? _avatar;

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _avatar = File(pickedFile.path);
      });
    }
  }

  void _validateForm() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Color(0xFFFFF7D6), // amarillo pastel
          title: Text(
            "Registro exitoso",
            style: TextStyle(
              fontFamily: "rocket",
              fontWeight: FontWeight.bold,
              color: Color(0xFF9B59B6), // morado pastel
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              ),
              child: Text(
                "OK",
                style: TextStyle(
                  fontFamily: "rocket",
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF9B59B6), // morado pastel
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF9B59B6), 
      appBar: AppBar(
        backgroundColor: Color(0xFF9B59B6),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFFF7C6E0)), 
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
            color: Color(0xFFFFE4F0), // rectángulo rosa pastel
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Column(
                  children: [
                    Text(
                      "Regístrate",
                      style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        fontFamily: "owl",
                        color: Color(0xFF9B59B6),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => Wrap(
                            children: [
                              ListTile(
                                leading: Icon(Icons.photo_library, color: Color(0xFF9B59B6)),
                                title: Text("Galería"),
                                onTap: () {
                                  Navigator.pop(context);
                                  _pickImage(ImageSource.gallery);
                                },
                              ),
                              ListTile(
                                leading: Icon(Icons.camera_alt, color: Color(0xFF9B59B6)),
                                title: Text("Cámara"),
                                onTap: () {
                                  Navigator.pop(context);
                                  _pickImage(ImageSource.camera);
                                },
                              ),
                            ],
                          ),
                        );
                      },
                      child: CircleAvatar(
                        radius: 60,
                        backgroundColor: Color(0xFF9B59B6),
                        backgroundImage: _avatar != null ? FileImage(_avatar!) : null,
                        child: _avatar == null
                            ? Icon(Icons.add_a_photo, size: 40, color: Color(0xFFF7C6E0))
                            : null,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                TextFieldWidget(
                  controller: _conName,
                  hintText: "Nombre completo",
                  icon: Icons.person,
                  validator: (value) => value!.isEmpty ? "Ingrese su nombre" : null,
                ),
                TextFieldWidget(
                  controller: _conEmail,
                  hintText: "Email",
                  icon: Icons.email,
                  validator: (value) {
                    if (value == null || value.isEmpty) return "Ingrese su email";
                    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                    if (!emailRegex.hasMatch(value)) return "Formato de email inválido";
                    return null;
                  },
                ),
                TextFieldWidget(
                  controller: _conPwd,
                  hintText: "Contraseña",
                  icon: Icons.lock,
                  obscureText: true,
                  validator: (value) => value!.isEmpty ? "Ingrese su contraseña" : null,
                ),
                TextFieldWidget(
                  controller: _conConf,
                  hintText: "Confirmar contraseña",
                  icon: Icons.lock,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) return "Confirme su contraseña";
                    if (value != _conPwd.text) return "Las contraseñas no coinciden";
                    return null;
                  },
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _validateForm,
                  style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    padding: EdgeInsets.symmetric(vertical: 15),
                    backgroundColor: Color(0xFF9B59B6),
                  ),
                  child: Text(
                    "Registrarse",
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: "rocket",
                      color: Color(0xFFF7C6E0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
