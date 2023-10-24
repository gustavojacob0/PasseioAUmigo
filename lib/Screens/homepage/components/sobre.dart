import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:passeio_aumigo/Screens/homepage/components/constraints.dart/textstyle.dart';
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
        title: const Text('Sobre'),
      ),
      
    );
  }
}
