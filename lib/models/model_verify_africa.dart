import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:zip/models/verify_africa.dart';


import '../resourses/api_constant.dart';
import '../resourses/helper.dart';



Future<ModelVerifyAfrica> verifyAfricaRepo({
  required mapData,
  required context,

  required fieldName1,
  required File file1,
})  async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  try {
    var request = http.MultipartRequest('POST', Uri.parse(ApiUrls.verificationAfrica));

    request.headers.addAll(await getAuthHeader());

    request.fields.addAll(mapData);

    if (file1.path != "") request.files.add(await multipartFile(fieldName1, file1));

    log(request.fields.toString());
    log(request.files.toString());

    final response = await request.send();
    Helpers.hideLoader(loader);
    String apiResponse = await response.stream.bytesToString();
    log("apiResponse ......    $apiResponse");
    if (response.statusCode == 200) {
      Helpers.hideLoader(loader);
      // log(jsonDecode(response.body)["message"]);
      return ModelVerifyAfrica.fromJson(
          jsonDecode(apiResponse));
    } else {
      Helpers.hideLoader(loader);
      return ModelVerifyAfrica.fromJson(
          jsonDecode(apiResponse));
    }
  } on SocketException catch (e) {
    Helpers.hideLoader(loader);
    return ModelVerifyAfrica();
  } catch (e) {
    Helpers.hideLoader(loader);
    return ModelVerifyAfrica();
  }
}

Future<http.MultipartFile> multipartFile(String? fieldName, File file1) async {
  return http.MultipartFile(
    fieldName ?? 'file',
    http.ByteStream(Stream.castFrom(file1.openRead())),
    await file1.length(),
    filename: file1.path.split('/').last,
  );
}
