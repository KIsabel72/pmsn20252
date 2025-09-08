import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:pmsn20252/utils/attribute_widget.dart';
import 'package:pmsn20252/utils/char_details.dart';
import 'package:pmsn20252/utils/char_model.dart';

const double degrees2Radians = math.pi / 180.0;

double radians(double degrees) => degrees * degrees2Radians;

class CharRowWidget extends StatelessWidget {
  final CharModel character;
  final double rowHeight;

  const CharRowWidget({
    Key? key,
    required this.character,
    this.rowHeight = 200,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: rowHeight,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Fondo 1
          Transform.translate(
            offset: const Offset(-10, 0),
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.01)
                ..rotateY(radians(1.5)),
              child: Container(
                height: 216,
                margin: const EdgeInsets.symmetric(horizontal: 40),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(22),
                ),
              ),
            ),
          ),
          // Fondo 2
          Transform.translate(
            offset: const Offset(-44, 0),
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.01)
                ..rotateY(radians(8)),
              child: Container(
                height: 188,
                margin: const EdgeInsets.symmetric(horizontal: 40),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(22),
                ),
              ),
            ),
          ),
          // Imagen del personaje
          Transform.translate(
            offset: const Offset(-50, 0),
            child: Hero(
              tag: character.name,
              child: Image.asset(
                character.image,
                width: rowHeight,
                height: rowHeight,
              ),
            ),
          ),
          // Atributos y botón
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              margin: const EdgeInsets.only(right: 58),
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                spacing: 5,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AttributeWidget(
                    progress: character.defense,
                    child: Image.asset('assets/defense.png', color: Colors.white),
                  ),
                  AttributeWidget(
                    progress: character.strategie,
                    child: Image.asset('assets/strategie.png', color: Colors.white),
                  ),
                  AttributeWidget(
                    progress: character.attack,
                    child: Image.asset('assets/wand.png', color: Colors.white),
                  ),
                  SizedBox(
                    height: 32,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => CharDetails(character),
                          ),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.white, width: 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'See Details',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
