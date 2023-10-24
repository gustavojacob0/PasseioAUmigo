import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:passeio_aumigo/Screens/homepage/components/constraints.dart/textstyle.dart';
import 'package:flutter/material.dart';

class Dicas extends StatefulWidget {
  const Dicas({Key? key}) : super(key: key);

  @override
  State<Dicas> createState() => _DicasState();
}

class _DicasState extends State<Dicas> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dicas'),
      ),
      
    );
  }
}
