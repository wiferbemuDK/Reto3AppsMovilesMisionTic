import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/interfaz/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyAK11Vv3ohcoK9sfGm1--qWMO0vUBC__mo",
          authDomain: "reto3-11148.firebaseapp.com",
          projectId: "reto3-11148",
          storageBucket: "reto3-11148.appspot.com",
          messagingSenderId: "487371629564",
          appId: "1:487371629564:web:b0fe547d2faf8f7af8c879",
          measurementId: "G-0EF41QST3N"));
  runApp(const MyApp());
}
