import 'package:flutter/material.dart';
import 'package:myapp/models/book.dart';

class BooksForm extends StatefulWidget {
  final Book? book;
  const BooksForm({super.key, this.book});

  @override
  // ignore: no_logic_in_create_state
  State<BooksForm> createState() => _BooksFormState(book);
}

class _BooksFormState extends State<BooksForm> {
  final TextEditingController txtTitle = TextEditingController();
  final TextEditingController txtPublicationYear = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String message = 'Nuevo Libro';
  final Book? bookToEdit;

  _BooksFormState(this.bookToEdit);

  @override
  void initState() {
    super.initState();
    if (bookToEdit != null) {
      txtTitle.text = bookToEdit!.title;
      txtPublicationYear.text = bookToEdit!.publicationYear;
      message = 'Editar Libro';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nuevo Libro"),
      ),
      body: Column(
        children: [
          SizedBox(height: 40,),
          Text(
            "Por favor rellene el siguiente formulario:", 
            style: TextStyle(
              fontWeight: FontWeight.bold, 
              color: Colors.indigo,
              fontSize: 18,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(50),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: txtTitle,
                    decoration: InputDecoration(
                      labelText: 'Titulo del libro',
                      icon: Icon(Icons.book, color: Colors.green,)
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'El campo no puede ser vacío';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    controller: txtPublicationYear,
                    decoration: InputDecoration(
                      labelText: 'Año de publicación',
                      icon: Icon(Icons.date_range, color: Colors.pink,)
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'El campo no puede ser vacío';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 100,),
                  ElevatedButton(
                    onPressed: () {
                      // Guardar el libro xd
                    }, 
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.save),
                        SizedBox(width: 10,),
                        Text("Guardar")
                      ],
                    )
                  )
                ],
              )
            ),
          )
        ],
      ),
    );
  }
}