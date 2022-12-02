import 'package:flutter/material.dart';
import 'package:flutter_application_1/proceso/autenticacion.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

final email = TextEditingController();
final password = TextEditingController();

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Acceso/Registro"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image(
                  image: NetworkImage(
                      "https://clipground.com/images/live-chat-logo-clipart-2.jpg")),
              TextField(
                controller: email,
                decoration: InputDecoration(
                    hintText: "Email", suffixIcon: Icon(Icons.email)),
              ),
              TextField(
                obscureText: true,
                controller: password,
                decoration: InputDecoration(
                    hintText: "Password", suffixIcon: Icon(Icons.key)),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton.icon(
                      onPressed: () {
                        autenticacion().IniciarSesion(
                            email: email.text, password: password.text);
                      },
                      icon: Icon(Icons.login),
                      label: Text("Iniciar Sesión"))),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton.icon(
                      onPressed: () {
                        autenticacion().CrearUsuario(
                            email: email.text, password: password.text);
                      },
                      icon: Icon(Icons.person_add_alt_1_rounded),
                      label: Text("Registrar Usuario"))),
            ],
          )),
    );
  }
}
