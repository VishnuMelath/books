import 'package:books/features/home_screen/pages/books_list_screen.dart';
import 'package:flutter/material.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const BooksListScreen(),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          selectedFontSize: 10,
          unselectedFontSize: 10,
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          items: [
            const BottomNavigationBarItem(
                icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: CircleAvatar(
                    radius: 10,
                    backgroundColor: selectedIndex == 1
                        ? Theme.of(context).primaryColor
                        : Colors.black38,
                    child: const Icon(
                      Icons.person_2_rounded,
                      size: 20,
                    )),
                label: 'Authors')
          ]),
    );
  }
}
