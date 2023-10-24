import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:passeio_aumigo/Screens/homepage/components/constraints.dart/textstyle.dart';
import 'package:flutter/material.dart';

class Agendamento extends StatefulWidget {
  const Agendamento({Key? key}) : super(key: key);

  @override
  State<Agendamento> createState() => _AgendamentoState();
}

class _AgendamentoState extends State<Agendamento> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agendamento'),
      ),
      
    );
  }
}
