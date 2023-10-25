import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EditPage extends StatefulWidget {
  const EditPage({
    Key? key,
    required this.docID,
  }) : super(key: key);
  final String docID;
  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final _formkey = GlobalKey<FormState>();
  CollectionReference updateUser =
      FirebaseFirestore.instance.collection('Animal');
  Future<void> _updateUser(id, nome, especie, raca, sexo, observacao) {
    return updateUser
        .doc(id)
        .update({
          'nome': nome,
          'especie': especie,
          'raca': raca,
          'sexo': sexo,
          'observacao': observacao
        })
        .then((value) => print("Pet Atualizado"))
        .catchError((error) => print("Falha ao atualizar: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        future: FirebaseFirestore.instance
            .collection('Animal')
            .doc(widget.docID)
            .get(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print('Something Wrong in HomePage');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          var data = snapshot.data?.data();
          var nome = data!['nome'];
          var especie = data['especie'];
          var raca = data['raca'];
          var sexo = data['sexo'];
          var observacao = data['observacao'];
          return Scaffold(
            appBar: AppBar(
              title: const Text('Editar'),
            ),
            body: Form(
              key: _formkey,
              child: ListView(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 18,
                      horizontal: 15,
                    ),
                    child: TextFormField(
                      initialValue: nome,
                      onChanged: (value) {
                        nome = value;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Nome',
                        labelStyle: TextStyle(fontSize: 18),
                        errorStyle: TextStyle(color: Colors.red, fontSize: 15),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 18,
                      horizontal: 15,
                    ),
                    child: TextFormField(
                      initialValue: especie,
                      onChanged: (value) {
                        especie = value;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Espécie',
                        labelStyle: TextStyle(fontSize: 18),
                        errorStyle: TextStyle(color: Colors.red, fontSize: 15),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 18,
                      horizontal: 15,
                    ),
                    child: TextFormField(
                      initialValue: raca,
                      onChanged: (value) {
                        raca = value;
                      },
                      decoration: const InputDecoration(
                        labelText: 'raca',
                        labelStyle: TextStyle(fontSize: 18),
                        errorStyle: TextStyle(color: Colors.red, fontSize: 15),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 18,
                      horizontal: 15,
                    ),
                    child: TextFormField(
                      initialValue: sexo,
                      onChanged: (value) {
                        sexo = value;
                      },
                      decoration: const InputDecoration(
                        labelText: 'sexo',
                        labelStyle: TextStyle(fontSize: 18),
                        errorStyle: TextStyle(color: Colors.red, fontSize: 15),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 18,
                      horizontal: 15,
                    ),
                    child: TextFormField(
                      initialValue: observacao,
                      onChanged: (value) {
                        observacao = value;
                      },
                      decoration: const InputDecoration(
                        labelText: 'observacao',
                        labelStyle: TextStyle(fontSize: 18),
                        errorStyle: TextStyle(color: Colors.red, fontSize: 15),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            setState(() {
                              _updateUser(widget.docID, nome, especie, raca,
                                  sexo, observacao);
                              Navigator.pop(context);
                            });
                          }
                        },
                        child: const Text('Atualizar'),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red),
                        ),
                        child: const Text('Restaurar'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
