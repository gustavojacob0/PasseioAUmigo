import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:passeio_aumigo/Screens/homepage/components/add.dart';
import 'package:passeio_aumigo/Screens/homepage/components/agendamento.dart';
import 'package:passeio_aumigo/Screens/homepage/components/perfil.dart';
import 'package:passeio_aumigo/Screens/homepage/components/avaliacao.dart';
import 'package:passeio_aumigo/Screens/homepage/components/constraints.dart/textstyle.dart';
import 'package:passeio_aumigo/Screens/homepage/components/constraints.dart/textfield.dart';
import 'package:passeio_aumigo/Screens/homepage/components/dicas.dart';
import 'package:passeio_aumigo/Screens/homepage/components/edit.dart';
import 'package:flutter/material.dart';
import 'package:passeio_aumigo/Screens/homepage/components/historico.dart';
import 'package:passeio_aumigo/Screens/homepage/components/notificacao.dart';
import 'package:passeio_aumigo/Screens/homepage/components/passeadores.dart';
import 'package:passeio_aumigo/Screens/homepage/components/sobre.dart';
import 'package:passeio_aumigo/Screens/login/login.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Stream<QuerySnapshot> studentRecords =
      FirebaseFirestore.instance.collection('Animal').snapshots();
  CollectionReference delUser = FirebaseFirestore.instance.collection('Animal');
  Future<void> _delete(id) {
    return delUser
        .doc(id)
        .delete()
        .then((value) => print('Excluir'))
        .catchError((_) => print('Erro ao excluir'));
  }

Future<String> getUserName() async {
  try {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
          .instance
          .collection('Usuario')
          .where('email', isEqualTo: user.email)
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        var userData = querySnapshot.docs[0].data();
        return userData['nome'];
      } else {
        print('Nenhum documento encontrado para o email: ${user.email}');
        return ''; 
      }
    } else {
      return ''; 
    }
  } catch (e) {
    print('Erro ao obter o nome do usuário: $e');
    return ''; 
  }
}

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: studentRecords,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print('Something Wrong in HomePage');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final List firebaseData = [];
          snapshot.data?.docs.map((DocumentSnapshot documentSnapshot) {
            Map store = documentSnapshot.data() as Map<String, dynamic>;
            firebaseData.add(store);
            store['id'] = documentSnapshot.id;
          }).toList();
          var txt;
          var txt2;

          return Scaffold(
              appBar: AppBar(
                backgroundColor: Color.fromARGB(255, 122, 110, 198),
                title: FutureBuilder<String>(
                future: getUserName(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text('Carregando...');
                  } else if (snapshot.hasError) {
                    return Text('Erro ao obter o nome do usuário.');
                  } else {
                    return Text('Olá, ${snapshot.data} seus Pets');
                  }
                },
              ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 253, 253, 253)),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddPage(),
                          ),
                        );
                      },
                      child: const Text(
                        'Adicionar Pet',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 146, 92, 240),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              body: Container(
                margin: const EdgeInsets.all(8),
                child: SingleChildScrollView(
                  child: Table(
                    border: TableBorder.all(),
                    columnWidths: const <int, TableColumnWidth>{
                      1: FixedColumnWidth(150),
                    },
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: <TableRow>[
                      TableRow(
                        children: [
                          TableCell(
                            child: Container(
                              color: Color.fromARGB(255, 165, 169, 249),
                              child: Center(
                                child: Text(
                                  'Nome',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 220, 223, 227),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          TableCell(
                            child: Container(
                              color: Color.fromARGB(255, 165, 169, 249),
                              child: Center(
                                child: Text(
                                  'Raça',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 220, 223, 227),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          TableCell(
                            child: Container(
                              color: Color.fromARGB(255, 165, 169, 249),
                              child: Center(
                                child: Text(
                                  'Ações',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 220, 223, 227),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      for (var i = 0; i < firebaseData.length; i++) ...[
                        TableRow(
                          children: [
                            TableCell(
                              child: SizedBox(
                                child: Center(
                                  child: Text(
                                    firebaseData[i]['nome'],
                                    style: txt2,
                                  ),
                                ),
                              ),
                            ),
                            TableCell(
                              child: SizedBox(
                                child: Center(
                                  child: Text(
                                    firebaseData[i]['raca'],
                                    style: txt2,
                                  ),
                                ),
                              ),
                            ),
                            TableCell(
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => EditPage(
                                            docID: firebaseData[i]['id'],
                                          ),
                                        ),
                                      );
                                    },
                                    icon: const Icon(
                                      Icons.edit,
                                      color: Color.fromARGB(255, 146, 92, 240),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      _delete(firebaseData[i]['id']);
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Color.fromARGB(255, 182, 147, 243),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              drawer: Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.home),
                      title: Text('Home'),
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.directions_walk),
                      title: Text('Passeadores'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Passeadores()),
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text('Perfil'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Perfil()),
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.support_agent),
                      title: Text('Agendamento'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Agendamento()),
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.star),
                      title: Text('Avaliação'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Avaliacao()),
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.history),
                      title: Text('Histórico'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Historico()),
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.notifications),
                      title: Text('Notificações'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Notificacao()),
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.tips_and_updates),
                      title: Text('Dicas de Cuidados'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Dicas()),
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.book),
                      title: Text('Sobre'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Sobre()),
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.logout),
                      title: Text('Sair'),
                      onTap: () async {
                        await FirebaseAuth.instance.signOut();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                        );
                      },
                    ),
                  ],
                ),
              ));
        });
  }
}
