

import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;


import '../models/buy_data_List_model.dart';
import '../models/cabel_tv_list_model.dart';
import '../models/model_all_transistion.dart';
import '../models/model_beneficary_list.dart';
import '../models/model_get_transfre_limit.dart';
import '../models/model_recieve_transistion.dart';
import '../resourses/api_constant.dart';
import '../resourses/helper.dart';

Future<BuyCavelTvList> buyCabelTvListRepo() async {
  try {
    http.Response response = await http.get(
      Uri.parse(ApiUrls.buycabletvList),
      headers: await getAuthHeader(),
    );

    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return BuyCavelTvList.fromJson(jsonDecode(response.body));
    } else {
      print(jsonDecode(response.body));
      return BuyCavelTvList(
          message: jsonDecode(response.body)["message"],
          status: false,
          data: null);
    }
  } catch (e) {
    return BuyCavelTvList(message: e.toString(), status: false, data: null);
  }
}
