import 'package:flutter/material.dart';
import 'package:nimbus/constants/auth_controller.dart';
import 'package:nimbus/veiws/loginScreen.dart';
import 'package:get_x/get.dart';

void main() {
  Get.put(AuthController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const LogInPage(),
    );
  }
}
