import 'package:myapp/models/author.dart';

class Book {
  int? id;
  String title;
  String publicationYear;
  int idAuthor;
  Author? author;
  
  Book({this.id, required this.title, required this.publicationYear, required this.idAuthor, this.author});

  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      'title': title,
      'idAuthor': idAuthor,
    };
  }

  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      title: map['title'], 
      publicationYear: 
      map['publicationYear'], 
      idAuthor: map['idAuthor'],
      author: Author.fromMap(map['author'])
    );
  }

  @override
  String toString() => title;
}