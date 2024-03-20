import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../models/get_update_model.dart';
import '../resourses/api_constant.dart';

Future<GetUpdateModel> getUpdateVersion({version, type}) async {
  // try {
  http.Response response = await http.get(
      Uri.parse(
          "http://178.128.83.16/api/app-version?version_code=$version&type=$type"),
      headers: await getAuthHeader());
  log("verify IN DATA${response.body}");
  // http.Response response = await http.post(Uri.parse(ApiUrls.loginUser),
  //     headers: await getAuthHeader(),body: jsonEncode(map) );

  if (response.statusCode == 200) {
    // Helpers.hideLoader(loader);
    print(jsonDecode(response.body));
    return GetUpdateModel.fromJson(jsonDecode(response.body));
  } else {
    // Helpers.hideLoader(loader);
    print(jsonDecode(response.body));
    return GetUpdateModel(
      message: jsonDecode(response.body)["message"],
    );
  }
  // }  catch (e) {
  //   Helpers.hideLoader(loader);
  //   return ModelCommonResponse(message: e.toString(), success: false);
}
