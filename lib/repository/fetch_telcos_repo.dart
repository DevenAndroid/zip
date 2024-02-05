import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/model_fetch_telcos.dart';
import '../models/model_get_binificery.dart';
import '../models/modelbenificerylist.dart';
import '../resourses/api_constant.dart';
import '../resourses/details.dart';
import '../resourses/helper.dart';

Future<ModelFetchTelcos> getTelcosRepo() async {
  final details = Get.put(DetailsController());

  // try {
  http.Response response = await http.get(
    Uri.parse(ApiUrls.getTelcos),
    headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json',
      "secret-key": details.secretKey,
    },
  );

  log("response.body.....    ${response.body}");
  log("response.body.....    ${response.statusCode}");

  if (response.statusCode == 200) {
    return ModelFetchTelcos.fromJson(jsonDecode(response.body));
  } else {
    return ModelFetchTelcos(
        message: jsonDecode(response.body)["message"],
        data: null,
        success: false);
  }

  // } catch (e) {
  //   return GetBenificiryModel(message: e.toString(),  data: null,success: false);
  // }
}
