

import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/model_choose_bank.dart';
import '../resourses/api_constant.dart';
import '../resourses/details.dart';


final details = Get.put(DetailsController());
Future<ChooseBankList> chooseBankRepo() async {
  var map = <String, dynamic>{};

  map['key'] = "banklist";
  print(map);
  try {
    http.Response response = await http.post(
      // Uri.parse(ApiUrls.chooseBank+"currency=$currency&country=$country"),
      Uri.parse(ApiUrls.common),
        headers: { HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
    },    body: jsonEncode(map)

    );

    print(jsonDecode(response.body));
    if (response.statusCode == 200) {

      return ChooseBankList.fromJson(jsonDecode(response.body));
    } else {
      print(jsonDecode(response.body));
      return ChooseBankList(
          data: null);
    }
  } catch (e) {
    throw Exception(e);
    // return ChooseBankList(message: e.toString(), data: null);
  }
}
