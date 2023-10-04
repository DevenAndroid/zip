

import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;


import '../models/get_address_model.dart';
import '../models/model_get_support_system.dart';
import '../models/model_get_transfre_limit.dart';
import '../models/model_kay .dart';
import '../resourses/api_constant.dart';
import '../resourses/helper.dart';

Future<ModelKey> getKeyRepo() async {
  try {
    http.Response response = await http.get(
      Uri.parse(ApiUrls.appKey),
      headers: await getAuthHeader(),
    );

    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return ModelKey.fromJson(jsonDecode(response.body));
    } else {
      print(jsonDecode(response.body));
      return ModelKey(
          message: jsonDecode(response.body)["message"],
          status: false,
          data: null);
    }
  } catch (e) {
    return ModelKey(message: e.toString(), status: false, data: null);
  }
}
