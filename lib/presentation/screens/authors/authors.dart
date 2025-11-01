import 'package:flutter/material.dart';
import 'package:myapp/presentation/screens/authors/authors_form.dart';

class AuthorsScreen extends StatefulWidget {
  const AuthorsScreen({super.key});

  @override
  State<AuthorsScreen> createState() => _AuthorsScreenState();
}

class _AuthorsScreenState extends State<AuthorsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Autores"),
      ),
      body: Center(child: Text("Hola mundo desde autores"),),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var response = await Navigator.push(context, MaterialPageRoute(builder: (context) => AuthorsForm()));
          if (response == null) {
            print("He regresado de autores!");
          }
        },
        child: Icon(Icons.add_circle_outline),
      ),
    );
  }
}