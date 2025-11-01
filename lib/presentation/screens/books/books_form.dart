import 'package:flutter/material.dart';

class BooksForm extends StatefulWidget {
  const BooksForm({super.key});

  @override
  State<BooksForm> createState() => _BooksFormState();
}

class _BooksFormState extends State<BooksForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nuevo Libro"),
      ),
      body: Text("Ingresando nuevo libro"),
    );
  }
}