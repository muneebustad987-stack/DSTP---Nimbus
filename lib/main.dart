import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nimbus/constants/auth_controller.dart';
import 'package:nimbus/veiws/botto_sheet.dart';


void main() {
  Get.put(AuthController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const BottoSheet(),
    );
  }
}
