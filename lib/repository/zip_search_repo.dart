import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../models/login_model.dart';
import '../models/modal_registor.dart';
import '../models/model_search.dart';
import '../models/model_search_zip.dart';
import '../models/model_update_address.dart';
import '../resourses/api_constant.dart';
import '../resourses/helper.dart';



Future<ModelSearchZip> zipSearchRepo({required String zip_tag,context}) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);







  // try {
  http.Response response = await http.get(Uri.parse(ApiUrls.zipSearch+"zip_tag=$zip_tag"),
    headers: await getAuthHeader(),
  );
  log("Sign IN DATA${response.body}");
  // http.Response response = await http.post(Uri.parse(ApiUrls.loginUser),
  //     headers: await getAuthHeader(),body: jsonEncode(map) );

  if (response.statusCode == 200) {
    Helpers.hideLoader(loader);

    return ModelSearchZip.fromJson(jsonDecode(response.body));

  } else {
    Helpers.hideLoader(loader);

    return ModelSearchZip(message: jsonDecode(response.body)["message"], );
  }
  // }  catch (e) {
  //   Helpers.hideLoader(loader);
  //   return ModelCommonResponse(message: e.toString(), success: false);
}