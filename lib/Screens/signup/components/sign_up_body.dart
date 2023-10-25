import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:passeio_aumigo/Screens/login/login.dart';
import 'package:passeio_aumigo/controller/flow_controller.dart';
import 'flow_one.dart';
import '../../../Screens/login/components/auth_page.dart';

class SignUpBodyScreen extends StatefulWidget {
  const SignUpBodyScreen({super.key});

  @override
  State<SignUpBodyScreen> createState() => _SignUpBodyScreenState();
}

class _SignUpBodyScreenState extends State<SignUpBodyScreen> {
  FlowController flowController = Get.put(FlowController());
  late int _currentFlow;

  @override
  void initState() {
    _currentFlow = FlowController().currentFlow;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromRGBO(165, 187, 229, 1.0),
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/Images/PasseioAUmigo.png',
                fit: BoxFit.cover,
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 535,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: HexColor("#ffffff"),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: GetBuilder<FlowController>(
                      builder: (context) {
                        if (flowController.currentFlow == 1) {
                          return const SignUpOne();
                        } else {
                          return const AuthPage();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
