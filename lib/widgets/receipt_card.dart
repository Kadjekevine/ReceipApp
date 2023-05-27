import 'package:flutter/material.dart';

class ReceiptCard extends StatelessWidget {
  final String image;
  final String title;
  final String time;
  const ReceiptCard({
    super.key,
    required this.image,
    required this.title,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.bottomLeft,
      width: MediaQuery.of(context).size.width - 30,
      height: MediaQuery.of(context).size.height * 0.3,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10),
                bottomLeft: Radius.circular(10))),
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
            Row(
              children: [
                const Icon(
                  Icons.timer,
                  color: Colors.white,
                ),
                Text(
                  time,
                  style: const TextStyle(color: Colors.white, fontSize: 17),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
