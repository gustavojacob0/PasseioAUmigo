import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:passeio_aumigo/Screens/homepage/components/constraints.dart/textstyle.dart';
import 'package:flutter/material.dart';

class Historico extends StatefulWidget {
  const Historico({Key? key}) : super(key: key);

  @override
  State<Historico> createState() => _HistoricoState();
}

class _HistoricoState extends State<Historico> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historico'),
      ),
      
    );
  }
}
