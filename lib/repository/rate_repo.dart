import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/model_rate.dart';
import '../resourses/api_constant.dart';
import '../resourses/details.dart';
import '../resourses/helper.dart';
final details = Get.put(DetailsController());
Future<ModelRate> getRateRepo() async {
  try {
    http.Response response = await http.get(
      Uri.parse(ApiUrls.getRate),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        "token": details.testToken
      },
    );

    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return ModelRate.fromJson(jsonDecode(response.body));
    } else {
      print(jsonDecode(response.body));
      return ModelRate(
          message: jsonDecode(response.body)["message"],
          status: false.toString(),
          data: null);
    }
  } catch (e) {
    return ModelRate(
        message: e.toString(), status: false.toString(), data: null);
  }
}
