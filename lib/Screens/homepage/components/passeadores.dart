import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:passeio_aumigo/Screens/homepage/components/constraints.dart/textstyle.dart';
import 'package:flutter/material.dart';

class Passeadores extends StatefulWidget {
  const Passeadores({Key? key}) : super(key: key);

  @override
  State<Passeadores> createState() => _PasseadoresState();
}

class _PasseadoresState extends State<Passeadores> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Passeadores'),
      ),
      
    );
  }
}
