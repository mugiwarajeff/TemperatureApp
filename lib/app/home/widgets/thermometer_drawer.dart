import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThermometerDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: const [
        DrawerHeader(
            child: Text(
          "Configurations",
          style: TextStyle(fontSize: 24),
        ))
      ],
    ));
  }
}
