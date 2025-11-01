import 'package:flutter/material.dart';
import 'package:myapp/models/author.dart';
import 'package:myapp/presentation/screens/authors/authors_form.dart';
import 'package:myapp/providers/author_provider.dart';

class AuthorsScreen extends StatefulWidget {
  const AuthorsScreen({super.key});

  @override
  State<AuthorsScreen> createState() => _AuthorsScreenState();
}

class _AuthorsScreenState extends State<AuthorsScreen> {
  List<Author> lstAuthors = [];
  bool isTimeOut = false;

  Future<void> loadAuthors() async {
    AuthorProvider authorProvider = AuthorProvider();
    var data = await authorProvider.getAllAuthors();
    if (data.isNotEmpty) {
      setState(() {
        lstAuthors = data;
      });
    } else {
      await Future.delayed(Duration(seconds: 3));
      isTimeOut = true;
    }
  }

  @override
  void initState() {
    super.initState();
    loadAuthors();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Autores")),
      body: Column(
        children: [
          Text("Listado de Autores"),
          SizedBox(height: 30),
          lstAuthors.isEmpty
              ? (isTimeOut
                    ? Center(child: Text("No hay autores en la base de datos"))
                    : Center(child: CircularProgressIndicator()))
              : ListView.builder(
                  itemCount: lstAuthors.length,
                  itemBuilder: (context, index) {
                    final authorTemp = lstAuthors[index];
                    return ListTile(
                      title: Text(authorTemp.name),
                      subtitle: Text(authorTemp.nationality),
                      leading: Icon(Icons.account_circle),
                    );
                  },
                ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var response = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AuthorsForm()),
          );
          if (response == null) {
            loadAuthors();
            print("He regresado de autores!");
          }
        },
        child: Icon(Icons.add_circle_outline),
      ),
    );
  }
}
