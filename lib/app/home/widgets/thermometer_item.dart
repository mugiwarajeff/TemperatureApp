import 'package:flutter/material.dart';

class ThermometerItem extends StatelessWidget {
  final IconData icon;
  final TextEditingController controller;

  const ThermometerItem(
      {Key? key, required this.icon, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16, left: 35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Icon(icon),
          ),
          SizedBox(
            width: 190,
            child: TextField(
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 32),
              controller: controller,
              textDirection: TextDirection.ltr,
              readOnly: true,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
          ),
        ],
      ),
    );
  }
}
