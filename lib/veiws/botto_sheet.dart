import 'package:flutter/material.dart';
import 'package:nimbus/veiws/favorite_screen.dart';
import 'package:nimbus/veiws/profile_screen.dart';
import 'home_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key, required this.user});

  final String user;

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int currIndex = 0;
  final List<Widget> _screens = [];

  @override
  void initState() {
    _screens.addAll([HomeScreen(user: widget.user), const FavoriteScreen(), const ProfileScreen()]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[currIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currIndex,
        onTap: (value) {
          currIndex = value;
          setState(() {});
        },
        selectedItemColor: Colors.blue,

        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined),
            label: "Explore",
          ),
          const BottomNavigationBarItem(icon: Icon(Icons.favorite_border_outlined), label: "Favorites"),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.person_2_outlined,
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}