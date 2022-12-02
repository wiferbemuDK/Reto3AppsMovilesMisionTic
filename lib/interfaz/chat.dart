import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/interfaz/mensajes.dart';
import 'package:flutter_application_1/proceso/autenticacion.dart';

class chat extends StatefulWidget {
  const chat({super.key});

  @override
  State<chat> createState() => _chatState();
}

final mensaje = TextEditingController();
final fire = FirebaseFirestore.instance;

class _chatState extends State<chat> {
  final FocusNode focus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
        children: [
          IconButton(
              onPressed: () {
                autenticacion().CerrarSesion();
              },
              icon: Icon(Icons.logout)),
          VerticalDivider(),
          Text((autenticacion().usuarios?.email).toString())
        ],
      )),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      focusNode: focus,
                      controller: mensaje,
                      decoration: InputDecoration(hintText: "Mensaje..."),
                      onSubmitted: (valor) {
                        focus.requestFocus();
                        mensaje.text = valor;
                        if (mensaje.text.isNotEmpty) {
                          fire.collection("chat").doc().set({
                            "mensaje": mensaje.text,
                            "tiempo": DateTime.now(),
                            "email":
                                (autenticacion().usuarios?.email).toString()
                          });
                          mensaje.clear();
                        }
                      },
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        if (mensaje.text.isNotEmpty) {
                          fire.collection("chat").doc().set({
                            "mensaje": mensaje.text,
                            "tiempo": DateTime.now(),
                            "email":
                                (autenticacion().usuarios?.email).toString()
                          });
                          mensaje.clear();
                        }
                      },
                      icon: Icon(Icons.send))
                ],
              ),
              Container(
                child: Expanded(child: mensajes()),
              )
            ],
          )),
    );
  }
}
