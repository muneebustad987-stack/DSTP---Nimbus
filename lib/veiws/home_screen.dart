import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nimbus/constants/home_controller.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.user});

  final String user;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  HomeController homeController = Get.put(HomeController());
  final double _scrollThreshold = 150;

  @override
  void initState() {
    _scrollController.addListener(() {
      if (!_scrollController.hasClients) return;
      if (_scrollController.position.extentAfter < _scrollThreshold &&
          homeController.hasNext) {
        homeController.getCities();
      }
    });
    super.initState();
  }

  InputDecoration _fieldDecoration(String hint, {Widget? prefixIcon}) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(color: Colors.grey),
    );
    return InputDecoration(
      hintText: hint,
      hintStyle: GoogleFonts.dmSans(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Colors.blueGrey,
      ),
      filled: true,
      fillColor: Colors.grey,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      border: border,
      enabledBorder: border,
      focusedBorder: border.copyWith(
        borderSide: BorderSide(color: Colors.blueGrey, width: 1.5),
      ),
      prefixIcon: prefixIcon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Good Evening",
                        style: GoogleFonts.dmSans(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.blueGrey,
                        ),
                      ),
                      Text(
                        widget.user,
                        style: GoogleFonts.sora(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.blueAccent,
                    child: Text(
                      style: GoogleFonts.dmSans(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                      widget.user
                          .trim()
                          .split(' ')
                          .map((l) => l[0])
                          .join()
                          .toUpperCase(),
                    ),
                  ),
                ],
              ),
              TextField(
                controller: _searchController,
                decoration: _fieldDecoration(
                  "Search cities or countries",
                  prefixIcon: Icon(Icons.search),
                ),
              ),
              Obx(() {
                return homeController.isRegionLoading.value
                    ? Shimmer.fromColors(
                        period: Duration(milliseconds: 1000),
                        baseColor: Colors.grey.shade400,
                        highlightColor: Colors.grey.shade200,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              regionShimmer(),
                              regionShimmer(),
                              regionShimmer(),
                              regionShimmer(),
                              regionShimmer(),
                            ],
                          ),
                        ),
                      )
                    : SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            for (
                              int index = 0;
                              index < homeController.regionList.length;
                              index++
                            ) ...[
                              GestureDetector(
                                onTap: () => homeController.regionTap(index),
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
                                    color:
                                        index ==
                                            homeController
                                                .selectedRegionIndex
                                                .value
                                        ? Colors.blueAccent
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(99),
                                    border: Border.all(
                                      color:
                                          index ==
                                              homeController
                                                  .selectedRegionIndex
                                                  .value
                                          ? Colors.blue
                                          : Colors.white,
                                    ),
                                  ),
                                  child: Text(
                                    homeController.regionList[index],
                                    style: TextStyle(
                                      color:
                                          index ==
                                              homeController
                                                  .selectedRegionIndex
                                                  .value
                                          ? Colors.black54
                                          : null,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      );
              }),
              GetBuilder<HomeController>(
                builder: (c) => Expanded(
                  child: c.isCitiesLoading && c.cities.isEmpty
                      ? ListView.builder(
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Shimmer.fromColors(
                              period: Duration(milliseconds: 1000),
                              baseColor: Colors.grey.shade400,
                              highlightColor: Colors.grey.shade200,
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 14),
                                padding: const EdgeInsets.all(14),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        color: Colors.lightBlue,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Icon(
                                        Icons.cloudy_snowing,
                                        size: 28,
                                        color: Colors.white,
                                      ),
                                    ),

                                    const SizedBox(width: 14),
                                  ],
                                ),
                              ),
                            );
                          },
                        )
                      : ListView.builder(
                          controller: _scrollController,
                          itemCount:
                              c.cities.length + (c.isCitiesLoading ? 1 : 0),
                          itemBuilder: (context, index) {
                            if (index == c.cities.length && c.hasNext) {
                              if (c.isCitiesLoading) {
                                return Shimmer.fromColors(
                                  period: Duration(milliseconds: 1000),
                                  baseColor: Colors.grey.shade400,
                                  highlightColor: Colors.grey.shade200,
                                  child: Container(
                                    width: double.infinity,
                                    height: 29,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: const Text("Show more"),
                                  ),
                                );
                              }
                            }
                            final city = c.cities[index];
                            return Container(
                              margin: const EdgeInsets.only(bottom: 14),
                              padding: const EdgeInsets.all(14),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: Colors.lightBlue,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Icon(
                                      Icons.cloudy_snowing,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                  ),

                                  const SizedBox(width: 14),

                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          city.name!,
                                          style: GoogleFonts.sora(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16,
                                            color: Colors.black54,
                                          ),
                                        ),

                                        const SizedBox(height: 2),

                                        Text(
                                          "${city.country!} · ${city.region!}",
                                          style: GoogleFonts.dmSans(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13,
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  const SizedBox(width: 4),

                                  Text(
                                    "${city.weather!.temperatureC!.toStringAsFixed(0)}°",
                                    style: GoogleFonts.sora(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 22,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget regionShimmer() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      margin: const EdgeInsets.only(left: 15, top: 14, bottom: 14),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(99),
        border: Border.all(
          color: Colors.white10,
          // color: AppColors.sideBorderColor,
        ),
      ),
    );
  }
}
