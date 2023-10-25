import 'package:flutter/material.dart';

class Sobre extends StatefulWidget {
  const Sobre({Key? key}) : super(key: key);

  @override
  State<Sobre> createState() => _SobreState();
}

class _SobreState extends State<Sobre> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sobre o Aplicativo'),
        backgroundColor: Color(0xFFA5BBE5),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.pets,
                    size: 40,
                    color: Color(0xFFA5BBE5),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Bem-vindo ao Passeio AUmigo!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFA5BBE5),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'O Passeio AUmigo é o aplicativo perfeito para agendar passeios com seus pets por meio dos seus vizinhos de condomínio. Oferecemos uma solução fácil e conveniente para garantir que seus pets recebam o cuidado e atenção que merecem, mesmo quando você está ocupado ou fora de casa.',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.developer_mode,
                      size: 40,
                      color: Color(0xFFA5BBE5),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Desenvolvido por:',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFA5BBE5),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Gustato Jacob & Deivid Lima',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Sobre(),
  ));
}
