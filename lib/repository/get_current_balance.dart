import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../models/current_balance_model.dart';
import '../resourses/api_constant.dart';

Future<CurrentBalanceModel> getCurrentBalanceRepo() async {
  final response = await http.get(Uri.parse("${ApiUrls.currentBalance}"),
      headers: await getAuthHeader());
  // Helper.hideLoader(loader);

  log(response.statusCode.toString());
  log(response.reasonPhrase.toString());

  if (response.statusCode == 200 || response.statusCode == 400) {
    print(response.body);
    // Helper.hideLoader(loader);

    return CurrentBalanceModel.fromJson(jsonDecode(response.body));
  } else {
    // Helper.hideLoader(loader);
    throw Exception('Failed to load data');
  }
}
