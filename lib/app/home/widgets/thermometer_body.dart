import 'package:flutter/material.dart';
import 'package:temperature_app/app/home/widgets/thermometer_item.dart';
import 'package:temperature_app/http/thermometerHTTP.dart';

import '../models/thermometer_model.dart';

class ThermometerBody extends StatefulWidget {
  final String buttonText = "Check values";
  final TextEditingController _temperatureController = TextEditingController();
  final TextEditingController _humidityController = TextEditingController();
  ThermometerClient client = ThermometerClient();

  @override
  State<StatefulWidget> createState() => _thermometerBodyState();
}

class _thermometerBodyState extends State<ThermometerBody> {
  void _confirmButton() async {
    List<Thermometer> ThermometersInfo = await widget.client.getActualValue();

    setState(() {
      widget._humidityController.text =
          "${ThermometersInfo[0].value.toString()} kg/m³";
      widget._temperatureController.text =
          "${ThermometersInfo[1].value.toString()} °C";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ThermometerItem(
            icon: Icons.sunny,
            controller: widget._temperatureController,
          ),
          ThermometerItem(
            icon: Icons.cloud,
            controller: widget._humidityController,
          ),
          ElevatedButton(
            onPressed: _confirmButton,
            child: Text(
              widget.buttonText,
              style: const TextStyle(color: Colors.black),
            ),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.yellow)),
          )
        ],
      ),
    );
  }
}
