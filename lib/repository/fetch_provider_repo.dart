import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../models/modal_send_otp_for_pin.dart';
import '../models/model_cabel_providers.dart';
import '../models/model_data_paln.dart';
import '../resourses/api_constant.dart';
import '../resourses/helper.dart';

Future<ModelCabelProvider> providerRepo({  provider}) async {

  var map = <String, dynamic>{};
  map['provider'] = provider;
  http.Response response = await http.post(Uri.parse(ApiUrls.provider),
      headers: { HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        "secret-key": "Fincra_SECRETDMVA1HLKTFYE4"

      },
      body: jsonEncode(map));
  log("Sign IN DATA${response.body}");
  print(map);

  if (response.statusCode == 200) {


    return ModelCabelProvider.fromJson(jsonDecode(response.body),);
  } else {


    return ModelCabelProvider(
        message: jsonDecode(response.body)["message"],success: false
    );
  }
}
