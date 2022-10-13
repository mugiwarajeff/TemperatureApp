class Thermometer {
  final String id;
  final double? value;
  final String variable;
  final String mqttTopic;

  Thermometer(
      {required this.id,
      required this.variable,
      required this.value,
      required this.mqttTopic});

  @override
  String toString() {
    return "id: $id, variable: $variable, value: $value, mqttTopic: $mqttTopic";
  }

  Thermometer.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        variable = json["variable"],
        value = json["value"] is int
            ? json["value"].toDouble()
            : double.tryParse(json["value"]),
        mqttTopic = json["metadata"]["mqtt_topic"];

  Map<String, dynamic> toJson() =>
      {"id": id, "variable": variable, "value": value, "mqtt_topic": mqttTopic};
}
