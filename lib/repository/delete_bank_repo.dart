import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:zip/models/bank_delete_model.dart';

import '../resourses/api_constant.dart';
import '../resourses/helper.dart';

Future<deleteBankModel> deleteBankRepo(
    {bank_id, accountNumber, context}) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var map = <String, dynamic>{};
  map['bank_id'] = bank_id;
  map['accountNumber'] = accountNumber;

  log(map.toString());
  http.Response response = await http.post(Uri.parse(ApiUrls.deleteBank),
      headers: await getAuthHeader(), body: jsonEncode(map));
  log("Sign IN DATA${response.body}");
  log("Sign IN DATA${response.statusCode}");
  print(map);

  if (response.statusCode == 200 || response.statusCode == 201) {
    Helpers.hideLoader(loader);
    return deleteBankModel.fromJson(
      jsonDecode(response.body),
    );
  } else {
    Helpers.hideLoader(loader);
    return deleteBankModel(
        message: jsonDecode(response.body)["message"], status: false);
  }
}
