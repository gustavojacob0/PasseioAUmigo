import 'package:flutter/material.dart';

class Historico extends StatefulWidget {
  const Historico({Key? key}) : super(key: key);

  @override
  State<Historico> createState() => _HistoricoState();
}

class _HistoricoState extends State<Historico> {
  final List<Map<String, dynamic>> historicoList = [
    {
      'data': '10/10/2023',
      'nomeAnimal': 'Rex',
      'comentario': 'Passeio alegre no parque.',
    },
    {
      'data': '15/10/2023',
      'nomeAnimal': 'Luna',
      'comentario': 'Luna adorou o passeio!',
    },
    {
      'data': '20/10/2023',
      'nomeAnimal': 'Buddy',
      'comentario': 'Passeio tranquilo e agradável.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Histórico'),
      ),
      body: ListView.builder(
        itemCount: historicoList.length,
        itemBuilder: (context, index) {
          final passeio = historicoList[index];
          return Card(
            elevation: 3,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              leading: Icon(
                Icons.history,
                color: Colors.blue,
                size: 40,
              ),
              title: Text(
                'Data: ${passeio['data']}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nome do Animal: ${passeio['nomeAnimal']}'),
                  Text('Comentário: ${passeio['comentario']}'),
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
    home: Historico(),
  ));
}
