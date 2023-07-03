import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;


import '../models/modelbenificerylist.dart';
import '../resourses/api_constant.dart';
import '../resourses/helper.dart';

Future<ModelBenificeryList> getListRepo() async {
  try {
    http.Response response = await http.get(
      Uri.parse(ApiUrls.benificeryList),
      headers: await getAuthHeaderApi(),
    );

    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return ModelBenificeryList.fromJson(jsonDecode(response.body));
    } else {
      print(jsonDecode(response.body));
      return ModelBenificeryList(
          message: jsonDecode(response.body)["message"],

          data: null);
    }
  } catch (e) {
    return ModelBenificeryList(message: e.toString(),  data: null);
  }
}
