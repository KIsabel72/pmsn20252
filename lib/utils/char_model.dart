class CharModel {
  final String name;
  final String image;
  final double defense;
  final double strategie;
  final double attack;

  CharModel({
    required this.name,
    required this.image,
    required this.defense,
    required this.strategie,
    required this.attack,
  });
}

final List<CharModel> characters = [
  CharModel(
    name: 'Harry Potter',
    image: 'assets/harry.png',
    defense: 60.0,
    strategie: 70.0,
    attack: 80.0,
  ),
  CharModel(
    name: 'Hermione Granger',
    image: 'assets/hermione.png',
    defense: 60.0,
    strategie: 90.0,
    attack: 70.0,
  ),
  CharModel(
    name: 'Ron Weasly',
    image: 'assets/ron.png',
    defense: 80.0,
    strategie: 60.0,
    attack: 60.0,
  ),
];
