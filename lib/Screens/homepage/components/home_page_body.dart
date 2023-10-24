import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:passeio_aumigo/Screens/homepage/components/add.dart';
import 'package:passeio_aumigo/Screens/homepage/components/agendamento.dart';
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
  // Getting Student all Records
  final Stream<QuerySnapshot> studentRecords =
      FirebaseFirestore.instance.collection('Animal').snapshots();
  // For Deleting Users
  CollectionReference delUser = FirebaseFirestore.instance.collection('Animal');
  Future<void> _delete(id) {
    return delUser
        .doc(id)
        .delete()
        .then((value) => print('Excluir'))
        .catchError((_) => print('Erro ao excluir'));
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
          // Storing Data
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
                title: Text('Meus Pets'),
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.purpleAccent),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddPage(),
                          ),
                        );
                      },
                      child: const Text('Adicionar'),
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
                              color: Colors.greenAccent,
                              child: Center(
                                child: Text(
                                  'Nome',
                                  style: txt,
                                ),
                              ),
                            ),
                          ),
                          TableCell(
                            child: Container(
                              color: Colors.greenAccent,
                              child: Center(
                                child: Text(
                                  'Raça',
                                  style: txt,
                                ),
                              ),
                            ),
                          ),
                          TableCell(
                            child: Container(
                              color: Colors.greenAccent,
                              child: Center(
                                child: Text(
                                  'Ações',
                                  style: txt,
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
                                      color: Colors.orange,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      _delete(firebaseData[i]['id']);
                                      //print(firebaseData);
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ], //this is loop
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
                          MaterialPageRoute(
                              builder: (context) => HomePage()),
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.directions_walk),
                      title: Text('Passeadores'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Passeadores()),
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.support_agent),
                      title: Text('Agendamento'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Agendamento()),
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
                          MaterialPageRoute(builder: (context) => Notificacao()),
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
