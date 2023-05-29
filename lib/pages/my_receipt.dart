import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/add_card.dart';
import 'package:flutter_application_1/pages/profile_page.dart';

class MyReceipt extends StatefulWidget {
  const MyReceipt({super.key});

  @override
  State<MyReceipt> createState() => _MyReceiptState();
}

class _MyReceiptState extends State<MyReceipt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text(
          "My Receipts",
          style: TextStyle(fontSize: 23),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()));
            },
            child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: const Icon(
                  Icons.account_circle,
                  size: 26,
                )),
          )
        ],
        leading: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()));
            },
            child: const Icon(Icons.arrow_back)),
      ),
      body: Column(
        children: [
          const Center(
            child: Text("No data"),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddCard()));
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
