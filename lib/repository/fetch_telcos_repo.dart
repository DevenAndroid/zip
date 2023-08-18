
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;


import '../models/model_fetch_telcos.dart';
import '../models/model_get_binificery.dart';
import '../models/modelbenificerylist.dart';
import '../resourses/api_constant.dart';
import '../resourses/helper.dart';

Future<ModelFetchTelcos> getTelcosRepo() async {

  // try {
  http.Response response = await http.get(
    Uri.parse(ApiUrls.getTelcos),
    headers: { HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json',
      "secret-key": "Fincra_SECRETDMVA1HLKTFYE4",
      "api-key":"m98zn3Y70MXGu1VaZNhYOZO7CbULj6uU"

    },
  );

  log("response.body.....    ${response.body}");
  log("response.body.....    ${response.statusCode}");

  if (response.statusCode == 200) {
    return ModelFetchTelcos.fromJson(jsonDecode(response.body));
  } else {
    return ModelFetchTelcos(message: jsonDecode(response.body)["message"],

        data: null,success: false);
  }

  // } catch (e) {
  //   return GetBenificiryModel(message: e.toString(),  data: null,success: false);
  // }
}
