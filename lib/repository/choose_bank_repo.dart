

import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../models/model_choose_bank.dart';
import '../resourses/api_constant.dart';



Future<ChooseBankList> chooseBankRepo(id) async {
  try {
    http.Response response = await http.get(
      Uri.parse("${ApiUrls.chooseBank}$id"),
      headers: await getAuthHeader(),
    );

    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return ChooseBankList.fromJson(jsonDecode(response.body));
    } else {
      print(jsonDecode(response.body));
      return ChooseBankList(
          message: jsonDecode(response.body)["message"],

          data: null);
    }
  } catch (e) {
    return ChooseBankList(message: e.toString(), data: null);
  }
}
