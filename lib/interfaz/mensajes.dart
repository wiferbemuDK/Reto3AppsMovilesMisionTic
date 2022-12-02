import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/proceso/autenticacion.dart';

class mensajes extends StatefulWidget {
  const mensajes({super.key});

  @override
  State<mensajes> createState() => _mensajesState();
}

class _mensajesState extends State<mensajes> {
  Stream<QuerySnapshot> r_consulta = FirebaseFirestore.instance
      .collection("chat")
      .orderBy("tiempo", descending: true)
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: r_consulta,
        builder: (context, AsyncSnapshot<QuerySnapshot> respuesta) {
          return respuesta.data?.docs.isEmpty == false
              ? ListView.builder(
                  itemCount: respuesta.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      color: (autenticacion().usuarios?.email).toString() ==
                              respuesta.data!.docs[index].get("email")
                          ? Colors.green[100]
                          : Colors.pinkAccent[100],
                      child: ListTile(
                        title: Text(respuesta.data!.docs[index].get("mensaje"),
                            textAlign:
                                (autenticacion().usuarios?.email).toString() ==
                                        respuesta.data!.docs[index].get("email")
                                    ? TextAlign.left
                                    : TextAlign.right),
                        subtitle: Text(respuesta.data!.docs[index].get("email"),
                            textAlign:
                                (autenticacion().usuarios?.email).toString() ==
                                        respuesta.data!.docs[index].get("email")
                                    ? TextAlign.left
                                    : TextAlign.right),
                      ),
                    );
                  },
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        });
  }
}
