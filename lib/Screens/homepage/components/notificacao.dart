import 'package:flutter/material.dart';

class Notificacao extends StatefulWidget {
  const Notificacao({Key? key}) : super(key: key);

  @override
  State<Notificacao> createState() => _NotificacaoState();
}

class _NotificacaoState extends State<Notificacao> {
  final List<Map<String, dynamic>> notificacoesList = [
    {
      'titulo': 'Novo Passeio Agendado',
      'mensagem': 'Você tem um passeio agendado para amanhã às 10h.',
      'data': '10/11/2023',
    },
    {
      'titulo': 'Promoção Especial',
      'mensagem': 'Não perca a promoção de 50% de desconto em passeios esta semana!',
      'data': '09/11/2023',
    },
    {
      'titulo': 'Avaliação Recebida',
      'mensagem': 'Um usuário avaliou o seu serviço com 5 estrelas!',
      'data': '08/11/2023',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notificações'),
      ),
      body: ListView.builder(
        itemCount: notificacoesList.length,
        itemBuilder: (context, index) {
          final notificacao = notificacoesList[index];
          return Card(
            elevation: 3,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              leading: Icon(
                Icons.notifications,
                color: Colors.blue,
                size: 40,
              ),
              title: Text(
                notificacao['titulo'],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(notificacao['mensagem']),
                  Text(
                    'Data: ${notificacao['data']}',
                    style: TextStyle(color: Colors.grey),
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
    home: Notificacao(),
  ));
}
