import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.signpost,
              size: 60,
              color: Color.fromARGB(255, 31, 17, 225),
            ),
            Text(
              "Sign in",
              style: TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.all(12),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Name",
                    border:
                        OutlineInputBorder(borderSide: BorderSide(width: 1))),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.all(12),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Email",
                    border:
                        OutlineInputBorder(borderSide: BorderSide(width: 1))),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.all(12),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Password",
                    border:
                        OutlineInputBorder(borderSide: BorderSide(width: 1))),
              ),
            ),
            SizedBox(height: 25),
            GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width / 2.5,
                        vertical: 15),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 31, 17, 225),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "Register",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ))),
            SizedBox(height: 15),
            Container(
              margin: EdgeInsets.only(left: 16),
              child: Row(
                children: [
                  Text(
                    "Already an account?",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                          color: Color.fromARGB(255, 31, 17, 225),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
