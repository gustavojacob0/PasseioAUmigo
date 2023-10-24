import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:passeio_aumigo/Screens/homepage/components/constraints.dart/textstyle.dart';
import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  //form key
  final _formkey = GlobalKey<FormState>();
  // text for textfield
  String nome = '';
  String especie = '';
  String raca = '';
  String sexo = '';
  String observacao = '';
  // textfield
  final nomeController = TextEditingController();
  final especieController = TextEditingController();
  final racaController = TextEditingController();
  final sexoController = TextEditingController();
  final observacaoController = TextEditingController();
  //Clearing Text
  _clearText() {
    nomeController.clear();
    especieController.clear();
    racaController.clear();
    sexoController.clear();
    observacaoController.clear();
  }

  //Resigtering Users
  CollectionReference addUser =
      FirebaseFirestore.instance.collection('Animal');
  Future<void> _registerUser() {
    return addUser
        .add({'nome': nome, 'especie': especie, 'raca': raca, 'sexo': sexo, 'observacao': observacao})
        .then((value) => print('Pet Adicionado'))
        .catchError((_) => print('Erro para adiconar Pet'));
  }

  //Disposing Textfield
  @override
  void dispose() {
    nomeController.dispose();
    especieController.dispose();
    racaController.dispose();
    sexoController.dispose();
    observacaoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar'),
      ),
      body: Form(
        key: _formkey,
        child: ListView(
          children: [
            CustomTextEditField(
              controller: nomeController,
              labettxt: 'Nome',
            ),
            CustomTextEditField(
              controller: especieController,
              labettxt: 'Espécie',
            ),
            CustomTextEditField(
              controller: racaController,
              labettxt: 'Raça',
            ),
             CustomTextEditField(
              controller: sexoController,
              labettxt: 'Sexo',
            ),
             CustomTextEditField(
              controller: observacaoController,
              labettxt: 'Observação',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      setState(() {
                        nome = nomeController.text;
                        especie = especieController.text;
                        raca = racaController.text;
                        sexo = sexoController.text;
                        observacao = observacaoController.text;
                        _registerUser();
                        _clearText();
                        Navigator.pop(context);
                      });
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
                  ),
                  child: const Text('Salvar'),
                ),
                ElevatedButton(
                  onPressed: _clearText,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.orangeAccent),
                  ),
                  child: const Text('Limpar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
