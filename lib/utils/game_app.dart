import 'package:flutter/material.dart';
import 'package:pmsn20252/utils/char_model.dart';
import 'package:pmsn20252/utils/char_widget.dart'; // Asegúrate que este widget esté optimizado también

class GameApp extends StatefulWidget {
  const GameApp({super.key});

  @override
  _GameAppState createState() => _GameAppState();
}

class _GameAppState extends State<GameApp> {
  late ScrollController _scrollController;
  double toolbarOpacity = 1.0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {
        if (_scrollController.offset <= 80) {
          toolbarOpacity = (80 - _scrollController.offset) / 80;
        } else {
          toolbarOpacity = 0;
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Aquí sí podemos usar MediaQuery
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF2C1F33), // Morado oscuro, tipo noche mágica
              Color(0xFF5A4635), // Marrón antiguo, como libros viejos
              Color(0xFFC9A66B), // Verde bosque, ambiente de Hogwarts
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: [
            ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.only(top: 80, bottom: 20),
              itemCount: characters.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 70.0),
                  child: CharRowWidget(character: characters[index]),
                );
              },
            ),
            Opacity(
              opacity: toolbarOpacity,
              child: SafeArea(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(width: 18),
                    const Text(
                      '¿Mago o bruja?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Expanded(child: SizedBox(height: 80)),
                    const SizedBox(
                      width: 80,
                      height: 80,
                      child: Icon(Icons.menu, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
