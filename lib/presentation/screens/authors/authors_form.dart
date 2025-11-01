import 'package:flutter/material.dart';
import 'package:myapp/models/author.dart';

class AuthorsForm extends StatefulWidget {
  final Author? author;

  const AuthorsForm({super.key, this.author});

  @override
  // ignore: no_logic_in_create_state
  State<AuthorsForm> createState() => _AuthorsFormState(author);
}

class _AuthorsFormState extends State<AuthorsForm> {
  final TextEditingController txtName = TextEditingController();
  final TextEditingController txtNationality = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String message = 'Nuevo Autor';
  final Author? authorToEdit;

  _AuthorsFormState(this.authorToEdit);

  @override
  void initState() {
    super.initState();
    if (authorToEdit != null) {
      txtName.text = authorToEdit!.name;
      txtNationality.text = authorToEdit!.nationality;
      message = 'Editar Autor';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(message),
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
                    controller: txtName,
                    decoration: InputDecoration(
                      labelText: 'Nombre del autor',
                      icon: Icon(Icons.account_box, color: Colors.blue,),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'El campo no puede ser vacío.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    controller: txtNationality,
                    decoration: InputDecoration(
                      labelText: 'Nacionalidad del autor',
                      icon: Icon(Icons.map, color: Colors.green,),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'El campo no puede ser vacío.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 100,),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Guardar
                      }
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