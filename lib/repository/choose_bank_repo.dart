

import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../models/model_choose_bank.dart';
import '../resourses/api_constant.dart';



Future<ChooseBankList> chooseBankRepo({required String currency,required String country,}) async {
  try {
    http.Response response = await http.get(
      Uri.parse(ApiUrls.chooseBank+"currency=$currency&country=$country"),
        headers: { HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
    "api-key": "m98zn3Y70MXGu1VaZNhYOZO7CbULj6uU",}
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
