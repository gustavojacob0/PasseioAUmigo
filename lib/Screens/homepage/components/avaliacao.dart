import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:passeio_aumigo/Screens/homepage/components/constraints.dart/textstyle.dart';
import 'package:flutter/material.dart';

class Avaliacao extends StatefulWidget {
  const Avaliacao({Key? key}) : super(key: key);

  @override
  State<Avaliacao> createState() => _AvaliacaoState();
}

class _AvaliacaoState extends State<Avaliacao> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Avaliacao'),
      ),
      
    );
  }
}
