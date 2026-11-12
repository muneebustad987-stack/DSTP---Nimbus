import 'package:flutter/material.dart';
import 'package:nimbus/constants/home_controller.dart';
import 'package:nimbus/veiws/demoStudent.dart';

class BottomSheet extends StatefulWidget {
  const BottomSheet({super.key});

  @override
  State<BottomSheet> createState() => _BottomSheetState();
}

class _BottomSheetState extends State<BottomSheet> {
  List<Widget> myScreen = [Demostudent()];
  HomeController controller = HomeController();
  int myScreenIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: myScreen[myScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: myScreenIndex,
        onTap: (index) {
          myScreenIndex = index;
          setState(() {});
        },
        backgroundColor: Color.fromARGB(255, 219, 218, 218),
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(fontSize: 20),
        unselectedLabelStyle: TextStyle(fontSize: 18),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Explore"),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorite",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
