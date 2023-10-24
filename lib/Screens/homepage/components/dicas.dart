import 'package:flutter/material.dart';

class Dicas extends StatefulWidget {
  const Dicas({Key? key}) : super(key: key);

  @override
  State<Dicas> createState() => _DicasState();
}

class _DicasState extends State<Dicas> {
  final List<Map<String, dynamic>> dicasList = [
    {
      'titulo': 'Passeios Diários',
      'descricao': 'Leve seu pet para passeios diários para mantê-lo saudável e feliz.',
      'icone': Icons.directions_walk,
      'cor': Colors.pink,
    },
    {
      'titulo': 'Alimentação Adequada',
      'descricao': 'Forneça uma alimentação balanceada.',
      'icone': Icons.restaurant,
      'cor': Colors.blue,
    },
    {
      'titulo': 'Cuidados Veterinários',
      'descricao': 'Agende check-ups regulares com o veterinário.',
      'icone': Icons.pets,
      'cor': Colors.orange,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dicas de Cuidado com Pets'),
      ),
      body: ListView.builder(
        itemCount: dicasList.length,
        itemBuilder: (context, index) {
          final dica = dicasList[index];
          return Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              title: Text(
                dica['titulo'],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16, // Reduzindo o tamanho do texto
                  color: dica['cor'],
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        dica['icone'],
                        size: 30, // Reduzindo o tamanho do ícone
                        color: dica['cor'],
                      ),
                      SizedBox(width: 12), // Reduzindo o espaçamento
                      Text(
                        dica['descricao'],
                        style: TextStyle(fontSize: 14), // Reduzindo o tamanho do texto
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Dicas(),
  ));
}
