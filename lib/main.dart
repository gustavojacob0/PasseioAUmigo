import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Screens/login/components/auth_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
     options: FirebaseOptions(
      apiKey: "AIzaSyDuAfDeQg322RdZH6u5WnVgFDjuhgnVI5w",
      appId: "1:632827762919:web:7682b6a050a9c2c2726a42",
      messagingSenderId: "632827762919",
      projectId: "passeio-aumigo",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Passeio AUmigo',
      theme: ThemeData().copyWith(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: HexColor("#A5BBE5"),
            ),
      ),
      home: const AuthPage(),
    );
  }
}