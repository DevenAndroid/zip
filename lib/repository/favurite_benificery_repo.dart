import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../models/model_beneficary_list.dart';
import '../models/model_favorite_benificery.dart';
import '../models/model_get_transfre_limit.dart';
import '../resourses/api_constant.dart';
import '../resourses/helper.dart';

Future<ModelFavourite> favouriteListGetRepo() async {
  try {
    http.Response response = await http.get(
      Uri.parse(ApiUrls.favouriteBeneficiary),
      headers: await getAuthHeader(),
    );

    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return ModelFavourite.fromJson(jsonDecode(response.body));
    } else {
      print(jsonDecode(response.body));
      return ModelFavourite(
          message: jsonDecode(response.body)["message"],
          status: false,
          data: null);
    }
  } catch (e) {
    return ModelFavourite(message: e.toString(), status: false, data: null);
  }
}
