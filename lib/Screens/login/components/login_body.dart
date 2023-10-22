import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:passeio_aumigo/components/my_button.dart';
import 'package:passeio_aumigo/components/my_textfield.dart';

import '../../signup/sign_up.dart';

class LoginBodyScreen extends StatefulWidget {
  const LoginBodyScreen({super.key});

  @override
  State<LoginBodyScreen> createState() => _LoginBodyScreenState();
}

class _LoginBodyScreenState extends State<LoginBodyScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserIn() async {
    try {
      // Entrar usando email e senha
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      showErrorMessage(e.code);
    }
  }

  void showErrorMessage(String message) {
    // Mostrar um diálogo com a mensagem de erro
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(message),
        );
      },
    );
  }

  String _errorMessage = "";

  void validarEmail(String val) {
    if (val.isEmpty) {
      setState(() {
        _errorMessage = "O email não pode estar em branco";
      });
    } else if (!EmailValidator.validate(val, true)) {
      setState(() {
        _errorMessage = "Endereço de email inválido";
      });
    } else {
      setState(() {
        _errorMessage = "";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromRGBO(165, 187, 229, 1.0),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'assets/Images/PasseioAUmigo.png',
                fit: BoxFit.cover, // Ajusta automaticamente ao tamanho da tela
              ),
              Container(
                height: 535, // Altura desejada
                width: double.infinity,
                decoration: BoxDecoration(
                  color: HexColor("#A5BBE5"),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Entrar",
                        style: GoogleFonts.poppins(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: HexColor("#4f4f4f"),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "E-mail",
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                color: HexColor("#8d8d8d"),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            MyTextField(
                              onChanged: (() {
                                validarEmail(emailController.text);
                              }),
                              controller: emailController,
                              hintText: "Insira seu e-mail",
                              obscureText: false,
                              prefixIcon: const Icon(Icons.mail_outline),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                              child: Text(
                                _errorMessage,
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Senha",
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                color: HexColor("#8d8d8d"),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            MyTextField(
                              controller: passwordController,
                              hintText: "**************",
                              obscureText: true,
                              prefixIcon: const Icon(Icons.lock_outline),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            MyButton(
                              onPressed: signUserIn,
                              buttonText: 'ACESSAR',
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(35, 0, 0, 0),
                              child: Row(
                                children: [
                                  Text("Ainda não tem conta?",
                                      style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        color: HexColor("#8d8d8d"),
                                      )),
                                  TextButton(
                                    child: Text(
                                      "Cadastrar",
                                      style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        color: HexColor("#44564a"),
                                      ),
                                    ),
                                    onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const SignUpScreen(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
