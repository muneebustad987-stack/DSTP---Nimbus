import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants/api_constant.dart';
import 'constants/api_controller.dart';
import 'demoStudent.dart';

class LoginScreenUi extends StatefulWidget {
  const LoginScreenUi({super.key});

  @override
  State<LoginScreenUi> createState() => _LoginScreenUiState();
}

class _LoginScreenUiState extends State<LoginScreenUi> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    var email = emailController.text;
    var password = passwordController.text;
    
    var myBody = {"email": email, "password": password};
    var response = await ApiController().post(url: ApiConstant.logInApi, body: myBody);
    print(response.$1);
    print(response.$2);
    setState(() {});

    if (response.$1 == 200 || response.$1 == 201) {
      print("NAVIGATE TO HOME SCREEN");
      var loginResponse = jsonDecode(response.$2);
      String token = loginResponse['token'];
      print("token $token");
      ApiController().saveToken(token: token);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Login successful"),
          backgroundColor: Colors.blueAccent,
        ),
      );

      var route = MaterialPageRoute(builder: (_) => Demostudent());
      Navigator.pushReplacement(context, route);
    } else {
      var loginResponse = jsonDecode(response.$2);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(loginResponse['messege'] ?? 'Login Failed')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 1, 138, 250),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.asset("assets/sun.png", height: 80),
              ),
              SizedBox(height: 20),
              Text(
                "Welcome back",
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Login to see weather for the cities you care about.",
                style: TextStyle(color: Colors.blueGrey),
              ),
              SizedBox(height: 20),
              Text("Email", style: TextStyle(color: Colors.blueGrey)),
              TextField(
                controller: emailController,
                style: const TextStyle(color: Colors.blueGrey),
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: "muneebsheikh@gmail.com",
                  hintStyle: const TextStyle(color: Colors.blueGrey),
                  prefixIcon: const Icon(Icons.email_outlined),
                  prefixIconColor: Colors.blue,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(
                      color: Colors.blueGrey,
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                  ),
                  border: const OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              Text("Password", style: TextStyle(color: Colors.blueGrey)),
              TextField(
                controller: passwordController,
                autofillHints: const [AutofillHints.password],
                style: const TextStyle(color: Colors.blueGrey),
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: "Password",
                  hintStyle: const TextStyle(color: Colors.blueGrey),
                  prefixIcon: const Icon(Icons.lock_outline),
                  prefixIconColor: Colors.blue,
                  suffixIcon: Icon(Icons.visibility),
                  suffixIconColor: Colors.blue,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(
                      color: Colors.blueGrey,
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(
                      color: Colors.blueGrey,
                      width: 2.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                  ),
                  onPressed: login,
                  child: Text(
                    "LOGIN",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
