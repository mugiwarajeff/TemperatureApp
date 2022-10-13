import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http/http.dart';
import 'package:http_interceptor/http/intercepted_client.dart';
import 'package:temperature_app/http/http_interceptor.dart';

import '../app/home/models/thermometer_model.dart';

const int expectedQuant = 2;

class ThermometerClient {
  InterceptedClient client =
      InterceptedClient.build(interceptors: [LoggingInterceptor()]);

  Uri endPoint = Uri.http("api.tago.io", "/data", {"qty": "2"});

  Map<String, String> auth = {
    "Authorization": "ecb20fe8-f41c-4f10-b1b3-033be47be750"
  };

  Future<List<Thermometer>> getActualValue() async {
    Response response = await client.get(endPoint, headers: auth);

    Map<String, dynamic> responseJson = jsonDecode(response.body);

    debugPrint(responseJson.toString());

    List resultJson = responseJson["result"];
    List<Thermometer> thermometers = resultJson
        .map((jsonThermometer) => Thermometer.fromJson(jsonThermometer))
        .toList();

    return thermometers;
  }
}
