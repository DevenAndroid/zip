import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;


import '../models/model_get_binificery.dart';
import '../models/modelbenificerylist.dart';
import '../resourses/api_constant.dart';
import '../resourses/helper.dart';

Future<GetBenificiryModel> getListRepo(   {required String businessID}) async {

  // // try {
  //   http.Response response = await http.get(
  //    Uri.parse(ApiUrls.getBeneficiaries+businessID),
  //     headers: { HttpHeaders.contentTypeHeader: 'application/json',
  //       HttpHeaders.acceptHeader: 'application/json',
  //       "api-key": "m98zn3Y70MXGu1VaZNhYOZO7CbULj6uU"
  //
  //     },
  //   );
  //
  //   log("response.body.....    ${response.body}");
  //   log("response.body.....    ${response.statusCode}");
  //
  //   if (response.statusCode == 200) {
  //     return GetBenificiryModel.fromJson(jsonDecode(response.body));
  //   } else {
  //     return GetBenificiryModel(message: jsonDecode(response.body)["message"],
  //
  //         data: null,success: false);
  //   }
  // // } catch (e) {
  // //   return GetBenificiryModel(message: e.toString(),  data: null,success: false);
  // // }

  var headers = {
    'api-key': 'm98zn3Y70MXGu1VaZNhYOZO7CbULj6uU',
    'Content-Type': 'application/json'
  };
  var request = http.Request('GET', Uri.parse('https://sandboxapi.fincra.com/profile/beneficiaries/business/'+businessID));
  request.body = json.encode({
    "page": "1",
    "perPage": "10000"
  });
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    return GetBenificiryModel.fromJson(
        jsonDecode(await response.stream.bytesToString()));
  }
  else {
    return GetBenificiryModel.fromJson(
        jsonDecode(await response.stream.bytesToString()));
  }

}
