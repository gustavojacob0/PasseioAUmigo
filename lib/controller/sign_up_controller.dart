import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:passeio_aumigo/Screens/homepage/home_page.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  String? _userType = "Student";
  String? get userType => _userType;
  void setUserType(String? text) {
    _userType = text;
    debugPrint("Updated userType: $userType");
    update();
  }

  String? _name;
  String? get name => _name;
  void setName(String? text) {
    _name = text;
    debugPrint("Updated name: $name");
    update();
  }

  String? _email;
  String? get email => _email;
  void setEmail(String? text) {
    _email = text;
    debugPrint("Updated email: $email");
    update();
  }

  String? _password;
  String? get password => _password;
  void setPassword(String? text) {
    _password = text;
    debugPrint("Updated password: $password");
    update();
  }

  String? _mobileNumber;
  String? get mobileNumber => _mobileNumber;
  void setMobileNumber(String? text) {
    _mobileNumber = text;
    debugPrint("Updated mobileNumber: $mobileNumber");
    update();
  }

  String? _collegeName;
  String? get collegeName => _collegeName;
  void setCollegeName(String? text) {
    _collegeName = text;
    debugPrint("Updated collegeName: $collegeName");
    update();
  }

  String? _admissionYear;
  String? get admissionYear => _admissionYear;
  void setAdmissionYear(String? text) {
    _admissionYear = text;
    debugPrint("Updated admissionYear: $admissionYear");
    update();
  }

  String? _passOutYear;
  String? get passOutYear => _passOutYear;
  void setPassOutYear(String? text) {
    _passOutYear = text;
    debugPrint("Updated passOutYear: $passOutYear");
    update();
  }

  Future postSignUpDetails() async {
    String newDocId = FirebaseAuth.instance.currentUser?.uid ?? '';
    DocumentReference newDocRef =
        FirebaseFirestore.instance.collection('user').doc(newDocId);

    await newDocRef.set({
      'docId': newDocId,
      'uid': FirebaseAuth.instance.currentUser!.uid,
      'userType': userType,
      'name': name,
      'email': email,
      'password': password,
      'mobileNumber': mobileNumber,
      'collegeName': collegeName
    });

    await Get.offAll(const HomeScreen());
  }

  Future<bool> registerUser(String email, String password) async {
    try {
      var response = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      return true;
    } catch (error) {
      if (error is FirebaseAuthException) {
        Get.showSnackbar(GetSnackBar(
          message: error.toString(),
        ));
      }
    }
    return false;
  }
}
