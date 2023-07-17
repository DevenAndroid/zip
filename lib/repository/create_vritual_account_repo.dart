
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

import '../models/create_virtual_account_model.dart';
import '../resourses/api_constant.dart';
import '../resourses/helper.dart';


Future<CreateVirtualAccountModel> VritualAccountProfile({
  required mapData,
  required fieldName1,
  required fieldName2,
  required fieldName3,
  required File file1,
  required File file2,
  required File file3,
  required context,
}) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  try {
    var request = http.MultipartRequest('POST', Uri.parse(ApiUrls.vritualAccountCreate));

    request.headers.addAll(await getAuthHeader());

    request.fields.addAll(mapData);

    if (file1.path != "") request.files.add(await multipartFile(fieldName1, file1));

    log(request.fields.toString());
    log(request.files.toString());

    final response = await request.send();
    Helpers.hideLoader(loader);
    if (response.statusCode == 200) {
      Helpers.hideLoader(loader);
      // log(jsonDecode(response.body)["message"]);
      return CreateVirtualAccountModel.fromJson(
          jsonDecode(await response.stream.bytesToString()));
    } else {
      Helpers.hideLoader(loader);
      return CreateVirtualAccountModel.fromJson(
          jsonDecode(await response.stream.bytesToString()));
    }
  } on SocketException {
    Helpers.hideLoader(loader);
    return CreateVirtualAccountModel(message: "No Internet Access", success: false);
  } catch (e) {
    Helpers.hideLoader(loader);
    return CreateVirtualAccountModel(message: e.toString(), success: false);
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
