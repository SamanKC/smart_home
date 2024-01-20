import 'package:flutter/material.dart';

Widget buildRoomWidget(
    {required String title,
    required String imagePath,
    required String temperature,
    required String devices,
    required VoidCallback onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Text(
                    temperature,
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ))),
          Image.asset(imagePath, height: 100),
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(devices),
        ],
      ),
    ),
  );
}
