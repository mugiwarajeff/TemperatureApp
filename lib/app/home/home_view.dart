import 'package:flutter/material.dart';
import 'package:temperature_app/app/home/widgets/thermometer_body.dart';

import 'widgets/thermometer_drawer.dart';

class HomeView extends StatelessWidget {
  final String appBarTitle = "Smart Thermometer";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      body: ThermometerBody(),
      drawer: ThermometerDrawer(),
    );
  }
}
