import 'package:flutter/material.dart';
import 'package:myapp/presentation/screens/books/books_form.dart';

class BooksScreen extends StatefulWidget {
  const BooksScreen({super.key});

  @override
  State<BooksScreen> createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Libros"),
      ),
      body: Center(child: Text("Hola mundo desde libros"),),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var response = await Navigator.push(context, MaterialPageRoute(builder: (context) => BooksForm()));
          if (response == null) {
            print("He regresado de libros!");
          }
        },
        child: Icon(Icons.add_circle_outline),
      ),
    );
  }
}