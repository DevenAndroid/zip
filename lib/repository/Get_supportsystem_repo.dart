

import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;


import '../models/model_get_support_system.dart';
import '../models/model_get_transfre_limit.dart';
import '../resourses/api_constant.dart';
import '../resourses/helper.dart';

Future<ModelGetSupportSystem> getSuppotSystemRepo() async {
  try {
    http.Response response = await http.get(
      Uri.parse(ApiUrls.supportCategories),
      headers: await getAuthHeader(),
    );

    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return ModelGetSupportSystem.fromJson(jsonDecode(response.body));
    } else {
      print(jsonDecode(response.body));
      return ModelGetSupportSystem(
          message: jsonDecode(response.body)["message"],
          status: false,
          data: null);
    }
  } catch (e) {
    return ModelGetSupportSystem(message: e.toString(), status: false, data: null);
  }
}
