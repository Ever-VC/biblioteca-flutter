import 'package:flutter/material.dart';

class AuthorsForm extends StatefulWidget {
  const AuthorsForm({super.key});

  @override
  State<AuthorsForm> createState() => _AuthorsFormState();
}

class _AuthorsFormState extends State<AuthorsForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nuevo Autor"),
      ),
      body: Text("Ingresando nuevo autor"),
    );
  }
}