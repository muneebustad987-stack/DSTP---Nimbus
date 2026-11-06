import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 1, 138, 250),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset("assets/sun.png", height: 80),
            ),
            SizedBox(height: 20),
            Text(
              "Create your account",
              style: GoogleFonts.sarabun(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 0, 17, 112),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Save cities and notes,and sync them on every device.",
              style: GoogleFonts.poppins(color: Colors.blueGrey, fontSize: 13),
            ),
            SizedBox(height: 20),
            Text(
              "Full Name",
              style: TextStyle(color: Colors.blueGrey, fontSize: 12),
            ),
            TextField(
              style: const TextStyle(color: Colors.blueGrey),
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: "Muneeb Sheikh",
                hintStyle: const TextStyle(color: Colors.blueGrey),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(
                    color: Colors.blueGrey,
                    width: 1.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(color: Colors.grey, width: 2.0),
                ),
                border: const OutlineInputBorder(),
              ),
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
                  borderSide: const BorderSide(color: Colors.grey, width: 2.0),
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
            SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                ),
                onPressed: Signupscreen.new,
                child: Text(
                  "Create Your Account",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(color: Colors.blueGrey),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("Login", style: TextStyle(color: Colors.blue)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
