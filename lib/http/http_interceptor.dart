import 'package:flutter/material.dart';
import 'package:http_interceptor/http/http.dart';
import 'package:http_interceptor/models/response_data.dart';
import 'package:http_interceptor/models/request_data.dart';

class LoggingInterceptor extends InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    debugPrint("Body: ${data.body}");
    debugPrint("Headers: ${data.headers.toString()}");

    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    debugPrint("Status Code: ${data.statusCode.toString()}");

    return data;
  }
}
