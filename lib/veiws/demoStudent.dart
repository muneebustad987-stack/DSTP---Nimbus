import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nimbus/constants/home_controller.dart';
import '../model/city.dart';

class Demostudent extends StatefulWidget {
  const Demostudent({super.key});

  @override
  State<Demostudent> createState() => _DemostudentState();
}

class _DemostudentState extends State<Demostudent> {
  HomeController controller = Get.put(HomeController());


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
                  "Muneeb Sheikh",
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
                    "MS",
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

            Obx(() {
              var selected = controller.selectedRegionIndex.value;
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    for (int i = 0; i < controller.regionList.length; i++)
                      GestureDetector(
                        onTap: () => controller.changeRegion(),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 9,
                          ),
                          margin: const EdgeInsets.only(
                            left: 15,
                            top: 14,
                            bottom: 14,
                          ),
                          decoration: BoxDecoration(
                            color: i == selected
                                ? Colors.blueAccent
                                : Colors.white,
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                              color: i == selected
                                  ? Colors.blue
                                  : Colors.white12,
                            ),
                          ),
                          child: Text(
                            controller.regionList[i],
                            style: TextStyle(
                              color: i == selected ? Colors.black87 : null,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              );
            }),

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
            GetBuilder<HomeController>(
                builder: (c) => Expanded(
                    child: ListView.builder(
                      itemCount: controller.cities.length + (controller.hasNext?1:0),
                      itemBuilder: (context, index) {
                        if (index==controller.cities.length && controller.hasNext){
                          return GestureDetector(
                            onTap: controller.getcities,
                            child: Container(
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
                          );
                        }
                        City city = controller.cities[index];
                        return Container(
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
                                        city.name!,
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 6),
                                      Text(
                                        city.country!,
                                        style: TextStyle(color: Colors.blueGrey),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 70),
                                  Text(
                                    city.weather!.temperatureC!.toStringAsFixed(0),
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
                        );
                      },
                    ),
                  )
                ),

            SizedBox(height: 40),

          ],
        ),
      ),
    );
  }
}
