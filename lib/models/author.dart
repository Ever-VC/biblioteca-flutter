class Author {
  int? id;
  String name;
  String nationality;

  Author({
    this.id,
    required this.name,
    required this.nationality
  });

  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'nationality': nationality
    };
  }

  factory Author.fromMap(Map<String, dynamic> map) {
    return Author(id: map['id'], name: map['name'], nationality: map['nationality']);
  }

  @override
  String toString() => name;
}