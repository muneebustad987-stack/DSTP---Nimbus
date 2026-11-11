import 'package:flutter/material.dart';
import 'package:get_x/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nimbus/constants/home_controller.dart';

class Demostudent extends StatefulWidget {
  const Demostudent({super.key});

  @override
  State<Demostudent> createState() => _DemostudentState();
}

class _DemostudentState extends State<Demostudent> {
  HomeController controller = Get.put(HomeController);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Good evening",
              style: GoogleFonts.poppins(
                color: Colors.blueGrey,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
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
                SizedBox(width: 100),
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
            SizedBox(height: 20),
            TextField(
              style: const TextStyle(color: Colors.blueGrey),
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: "Search cities or countries",
                hintStyle: const TextStyle(color: Colors.blueGrey),
                prefixIcon: const Icon(Icons.search),
                prefixIconColor: Colors.blueGrey,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(color: Colors.grey, width: 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(color: Colors.grey, width: 2.0),
                ),
                border: const OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Container(
            //       padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            //       decoration: BoxDecoration(
            //         color: Colors.blue,
            //         borderRadius: BorderRadius.circular(25),
            //         border: Border.all(color: Colors.blue),
            //       ),
            //       child: Text(
            //         "All",
            //         style: TextStyle(
            //           color: Colors.white,
            //           fontSize: 15,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //     ),
            //     Container(
            //       padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            //       decoration: BoxDecoration(
            //         color: const Color.fromARGB(255, 230, 226, 226),
            //         borderRadius: BorderRadius.circular(25),
            //         border: Border.all(
            //           color: Color.fromARGB(255, 230, 226, 226),
            //         ),
            //       ),
            //       child: Text(
            //         "Asia",
            //         style: TextStyle(
            //           color: Colors.black,
            //           fontSize: 15,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //     ),
            //     Container(
            //       padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            //       decoration: BoxDecoration(
            //         color: const Color.fromARGB(255, 230, 226, 226),
            //         borderRadius: BorderRadius.circular(25),
            //         border: Border.all(
            //           color: Color.fromARGB(255, 230, 226, 226),
            //         ),
            //       ),
            //       child: Text(
            //         "Europe",
            //         style: TextStyle(
            //           color: Colors.black,
            //           fontSize: 15,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //     ),
            //     Container(
            //       padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            //       decoration: BoxDecoration(
            //         color: const Color.fromARGB(255, 230, 226, 226),
            //         borderRadius: BorderRadius.circular(25),
            //         border: Border.all(
            //           color: Color.fromARGB(255, 230, 226, 226),
            //         ),
            //       ),
            //       child: Text(
            //         "Africa",
            //         style: TextStyle(
            //           color: Colors.black,
            //           fontSize: 15,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Cities",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "23 result",
                  style: TextStyle(color: Colors.blueGrey, fontSize: 14),
                ),
              ],
            ),
            SizedBox(height: 10),

            Container(
              margin: EdgeInsets.only(bottom: 10.0),
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 214, 210, 210),
                borderRadius: BorderRadius.circular(14),
                boxShadow: [BoxShadow(color: Colors.white24)],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 35,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          Icons.cloudy_snowing,
                          color: Colors.blue,
                          size: 28,
                        ),
                      ),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Aukland",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            "New Zeland . Oceania",
                            style: TextStyle(color: Colors.blueGrey),
                          ),
                        ],
                      ),
                      SizedBox(width: 70),
                      Text(
                        "15°",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10.0),
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 214, 210, 210),
                borderRadius: BorderRadius.circular(14),
                boxShadow: [BoxShadow(color: Colors.white24)],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 35,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          Icons.wb_sunny_outlined,
                          color: Colors.blue,
                          size: 28,
                        ),
                      ),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Bangkok",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            "Thailand . Asia",
                            style: TextStyle(color: Colors.blueGrey),
                          ),
                        ],
                      ),
                      SizedBox(width: 130),
                      Text(
                        "33°",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10.0),
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 214, 210, 210),
                borderRadius: BorderRadius.circular(14),
                boxShadow: [BoxShadow(color: Colors.white24)],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 35,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          Icons.wb_sunny_outlined,
                          color: Colors.blue,
                          size: 28,
                        ),
                      ),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Buenson Aires",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            "Argentina . South America",
                            style: TextStyle(color: Colors.blueGrey),
                          ),
                        ],
                      ),
                      SizedBox(width: 60),
                      Text(
                        "19°",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10.0),
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 214, 210, 210),
                borderRadius: BorderRadius.circular(14),
                boxShadow: [BoxShadow(color: Colors.white24)],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 35,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          Icons.wb_sunny_outlined,
                          color: Colors.blue,
                          size: 28,
                        ),
                      ),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Cairo",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            "Egypt . Africa",
                            style: TextStyle(color: Colors.blueGrey),
                          ),
                        ],
                      ),
                      SizedBox(width: 140),
                      Text(
                        "27°",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 219, 218, 218),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Text(
                  "Load more . page 2 of 3",
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
              ],
            ),
        ),
    );
  }
}
