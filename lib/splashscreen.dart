import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants/api_constant.dart';
import 'constants/api_controller.dart';
import 'demoStudent.dart';
import 'loginScreen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    onInitCalled();
    super.initState();
  }

  Future<void> onInitCalled() async {
    var response = await ApiController().get(
        url: ApiConstant.rememberMeApi, isToken: true);
    if (response.$1 == 200 || response.$1 == 201){
    var route = MaterialPageRoute(builder: (_) => Demostudent());
    Navigator.pushReplacement(context, route);
  } else{
  var route = MaterialPageRoute(builder: (_) => LoginScreenUi());
  Navigator.pushReplacement(context, route);}
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(248, 46, 0, 126),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            CircularProgressIndicator(
              backgroundColor: Colors.blueAccent,
            ),
            Text(
              "Nimbus",
              style: GoogleFonts.actor(color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Weather & city guide",
              style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 40),
            Text(
              "Checking your session...",
              style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
