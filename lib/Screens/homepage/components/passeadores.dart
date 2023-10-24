import 'package:flutter/material.dart';

class Passeadores extends StatefulWidget {
  const Passeadores({Key? key}) : super(key: key);

  @override
  State<Passeadores> createState() => _PasseadoresState();
}

class _PasseadoresState extends State<Passeadores> {
  final List<Map<String, String>> peopleList = [
    {
      'name': 'João',
      'location': 'Condomínio Águas das Pedras',
    },
    {
      'name': 'Maria',
      'location': 'Condomínio Bosque Amarelo',
    },
    {
      'name': 'Pedro',
      'location': 'Condomínio Cruz das Posses',
    },
    {
      'name': 'Ana',
      'location': 'Condomínio Deus Altissímo',
    },
    {
      'name': 'Luiz',
      'location': 'Condomínio Esmeralda',
    },
    {
      'name': 'Mariana',
      'location': 'Condomínio Fogo Ardente',
    },
    {
      'name': 'Carlos',
      'location': 'Condomínio Guaporé',
    },
    {
      'name': 'Sandra',
      'location': 'Condomínio das Orquídeas',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Passeadores'),
      ),
      body: ListView.builder(
        itemCount: peopleList.length,
        itemBuilder: (context, index) {
          final person = peopleList[index];
          return ListTile(
            leading: Icon(Icons.person),
            title: Text(person['name']!),
            subtitle: Text(person['location']!),
          );
        },
      ),
    );
  }
}

void main() => runApp(MaterialApp(
  home: Passeadores(),
));
