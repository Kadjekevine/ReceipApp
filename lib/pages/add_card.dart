import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:flutter_application_1/pages/my_receipt.dart';
import 'package:image_picker/image_picker.dart';

class AddCard extends StatefulWidget {
  const AddCard({super.key});

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  ImagePicker picker = ImagePicker();
  XFile? image;

  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyReceipt()));
              },
              child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                  child: Icon(
                    Icons.arrow_back,
                    size: 35,
                  )),
            ),
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 228, 224, 224),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Add Menu",
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    color: Colors.white,
                    margin: EdgeInsets.all(12),
                    child: TextField(
                      controller: _titleController,
                      decoration: InputDecoration(
                        hintText: "Title",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 1),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    color: Colors.white,
                    margin: EdgeInsets.all(12),
                    child: TextField(
                      controller: _timeController,
                      decoration: InputDecoration(
                        hintText: "Time",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 1),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    color: Colors.white,
                    margin: EdgeInsets.all(12),
                    child: TextField(
                      controller: _descriptionController,
                      decoration: InputDecoration(
                        hintText: "Description",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 1),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () async {
                      image =
                          await picker.pickImage(source: ImageSource.gallery);
                      setState(() {
                        //update UI
                      });
                    },
                    child: Container(
                        color: Color.fromARGB(255, 91, 88, 86),
                        margin: EdgeInsets.all(12),
                        padding:
                            EdgeInsets.symmetric(horizontal: 120, vertical: 20),
                        child: Text(
                          "Choisir une image",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                  SizedBox(height: 25),
                  GestureDetector(
                      onTap: () {
                        try {
                          final data = {
                            "title": _titleController.text.trim(),
                            "time": _timeController.text.trim(),
                            "description": _descriptionController.text.trim(),
                            "image":
                                "https://source.unsplash.com/collection/225/800x600"
                          };

                          FirebaseFirestore.instance
                              .collection("menu")
                              .add(data)
                              .then((documentSnapshot) => print(
                                  "Added Data with ID: ${documentSnapshot.id}"));
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Home()));
                        } catch (e) {
                          const AlertDialog(
                            title: Text("Erreur"),
                          );
                        }
                      },
                      child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width / 2.5,
                              vertical: 15),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 31, 17, 225),
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            "Save",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
