import 'package:flutter/material.dart';

class Avaliacao extends StatefulWidget {
  const Avaliacao({Key? key}) : super(key: key);

  @override
  State<Avaliacao> createState() => _AvaliacaoState();
}

class _AvaliacaoState extends State<Avaliacao> {
  int _rating = 0;
  String _comment = "";

  void _rateApp(int rating) {
    setState(() {
      _rating = rating;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Avaliação'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Classificação:',
              style: TextStyle(fontSize: 18),
            ),
            Row(
              children: <Widget>[
                for (int i = 1; i <= 5; i++)
                  GestureDetector(
                    onTap: () {
                      _rateApp(i);
                    },
                    child: Icon(
                      i <= _rating ? Icons.star : Icons.star_border,
                      size: 40,
                      color: Colors.amber,
                    ),
                  ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Escreva um Comentário:',
              style: TextStyle(fontSize: 18),
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  _comment = value;
                });
              },
              maxLines: 5,
            ),
            SizedBox(height: 20),
            Text(
              'Sua Classificação: $_rating estrelas',
              style: TextStyle(fontSize: 18),
            ),
            ElevatedButton(
              onPressed: () {
                print('Avaliação: $_rating estrelas');
                print('Comentários: $_comment');
              },
              child: Text('Enviar Avaliação'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(
      home: Avaliacao(),
    ));
