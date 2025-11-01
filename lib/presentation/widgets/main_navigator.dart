import 'package:flutter/material.dart';
import 'package:myapp/presentation/screens/authors/authors.dart';
import 'package:myapp/presentation/screens/books/books.dart';
import 'package:myapp/presentation/screens/home.dart';

class NavigationMain extends StatefulWidget {
  const NavigationMain({super.key});

  @override
  State<NavigationMain> createState() => NavigationMainState();
}

class NavigationMainState extends State<NavigationMain> {
  final lstScreens = [AuthorsScreen(), HomeScreen(), BooksScreen()];
  int selScreenIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selScreenIndex,
        children: lstScreens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selScreenIndex,
        onTap: (value) {
          setState(() {
            selScreenIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: 'Autores',
            icon: Icon(Icons.account_box_outlined),
            activeIcon: Icon(Icons.account_box)
          ),
          BottomNavigationBarItem(
            label: 'Inicio',
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
            label: 'Libros',
            icon: Icon(Icons.book_outlined),
            activeIcon: Icon(Icons.book)
          )
        ]
      ),
    );
  }
}