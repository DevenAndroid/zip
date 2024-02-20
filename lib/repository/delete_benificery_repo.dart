import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:zip/models/delete_benificery_model.dart';

import '../resourses/api_constant.dart';
import '../resourses/helper.dart';

Future<DeleteBenificeryModel> deleteBeneficiaryRepo(
    {beneficiary_id, context}) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var map = <String, dynamic>{};
  map['beneficiary_id'] = beneficiary_id;

  log(map.toString());
  http.Response response = await http.post(Uri.parse(ApiUrls.deleteBeneficiary),
      headers: await getAuthHeader(), body: jsonEncode(map));
  log("Sign IN DATA${response.body}");
  log("Sign IN DATA${response.statusCode}");
  print(map);

  if (response.statusCode == 200 || response.statusCode == 201) {
    Helpers.hideLoader(loader);
    return DeleteBenificeryModel.fromJson(
      jsonDecode(response.body),
    );
  } else {
    Helpers.hideLoader(loader);
    return DeleteBenificeryModel(
        message: jsonDecode(response.body)["message"], status: false);
  }
}
