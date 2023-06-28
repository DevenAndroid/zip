import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../models/ziptagmodel.dart';
import '../resourses/api_constant.dart';
import '../resourses/helper.dart';

Future<ZipTagModel> verifyOtpRepo(
    {zip_tag, context}) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var map = <String, dynamic>{};

  map['zip_tag'] = zip_tag;

  http.Response response = await http.post(
      Uri.parse(ApiUrls.zipTag),
      headers: await getAuthHeader(),
      body: jsonEncode(map));
  log("Sign IN DATA${response.body}");

  if (response.statusCode == 200) {
    Helpers.hideLoader(loader);
    print(jsonDecode(response.body));
    return ZipTagModel.fromJson(jsonDecode(response.body));
  } else {
    Helpers.hideLoader(loader);
    print(jsonDecode(response.body));
    return ZipTagModel(
      message: jsonDecode(response.body)["message"],
    );
  }
}
