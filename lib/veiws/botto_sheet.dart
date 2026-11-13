import 'package:flutter/material.dart';
import 'package:nimbus/veiws/demoStudent.dart';

class BottoSheet extends StatefulWidget {
  const BottoSheet({super.key});

  @override
  State<BottoSheet> createState() => _BottoSheetState();
}

class _BottoSheetState extends State<BottoSheet> {
  List<Widget> myScreenList = [Demostudent()];

  int myScreenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: myScreenList[myScreenIndex],

      backgroundColor: Colors.grey,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: myScreenIndex,
        onTap: (index) {
          setState(() {
            myScreenIndex = index;
          });
        },
        backgroundColor: Colors.white,
        selectedItemColor: Colors.lightBlue,
        unselectedItemColor: Colors.black54,
        selectedLabelStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: const TextStyle(fontSize: 12),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Explore"),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: "Favorites",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
