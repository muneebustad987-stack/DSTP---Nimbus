import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Demostudent extends StatefulWidget {
  const Demostudent({super.key});

  @override
  State<Demostudent> createState() => _DemostudentState();
}

class _DemostudentState extends State<Demostudent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Good evening",
              style: GoogleFonts.poppins(color: Colors.blueGrey, fontSize: 16),
            ),
            Row(
              children: [
                Text(
                  "Demo Students",
                  style: GoogleFonts.actor(
                    color: const Color.fromARGB(255, 0, 24, 163),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 200),
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.blue,
                  child: Text(
                    "DS",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
