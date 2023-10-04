import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


import '../models/fetchVirtualAccount_model.dart';
import '../models/model_verify_otp.dart';
import '../models/registor_model.dart';
import '../resourses/api_constant.dart';
import '../resourses/details.dart';
import '../resourses/helper.dart';


final details = Get.put(DetailsController());
Future<FetchVirtualAccountModel> fetchAccountRepo({required String id}) async {







  try {
  http.Response response = await http.get(Uri.parse(ApiUrls.fetchAccount+id),
      headers: { HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        "api-key":details.apiKey

      });


  // http.Response response = await http.post(Uri.parse(ApiUrls.loginUser),
  //     headers: await getAuthHeader(),body: jsonEncode(map) );

  if (response.statusCode == 200) {

    print(jsonDecode(response.body));
    return FetchVirtualAccountModel.fromJson(jsonDecode(response.body));

  } else {

    print(jsonDecode(response.body));
    return FetchVirtualAccountModel(message: jsonDecode(response.body)["message"],success: false );
  }
 }  catch (e) {

   return FetchVirtualAccountModel(message: e.toString(), success: false);
}}
