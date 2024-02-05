import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../models/model_get_support_system.dart';
import '../models/model_get_transfre_limit.dart';
import '../models/model_get_verify_africa.dart';
import '../resourses/api_constant.dart';
import '../resourses/helper.dart';

Future<ModelGetAfrica> getAfricaApiRepo({Id}) async {
  try {
    http.Response response = await http.get(
      Uri.parse(ApiUrls.getAfricaUser + Id),
      headers: await getAuthHeader(),
    );

    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return ModelGetAfrica.fromJson(jsonDecode(response.body));
    } else {
      print(jsonDecode(response.body));
      return ModelGetAfrica(
          message: jsonDecode(response.body)["message"],
          status: false,
          data: null);
    }
  } catch (e) {
    return ModelGetAfrica(message: e.toString(), status: false, data: null);
  }
}
