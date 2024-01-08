import 'dart:convert';
import 'dart:io';

import 'package:get/get_connect/http/src/response/response.dart';
import 'package:http/http.dart' as http;
import '../models/modelAfricaLive.dart';
import '../models/model_movement_rates_response.dart';
import '../resourses/api_constant.dart';

Future<ModelMovementsRateResponse> getCurrency() async {
  try {
    http.Response response = await http.get(
      Uri.parse(ApiUrls.currencylist),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        "Authorization": "Bearer 7a9ec0c4a3a8f1f63c628051428283f5394b1ff6",
      },
    );

    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return ModelMovementsRateResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.body);
    }
  } catch (e) {
    throw Exception(e);
  }
}
