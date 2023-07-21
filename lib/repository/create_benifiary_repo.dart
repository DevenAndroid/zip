import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../models/create_benificiary.dart';
import '../models/modal_registor.dart';
import '../models/model_update_password.dart';
import '../resourses/api_constant.dart';
import '../resourses/helper.dart';



Future<CreateBenificiryModel> createBenificiryRepo({firstName,email,accountHolderName,type,currency,paymentDestination,destinationAddress,lastName,required String businessID}) async {

  var map = <String, dynamic>{};

  map['firstName'] = firstName;

  map['accountHolderName'] = accountHolderName;
  map['email'] = email;



  map['type'] =  type;
  map['currency'] =  currency;
  map['paymentDestination'] =  paymentDestination;
  map['destinationAddress'] =  destinationAddress;
  map['lastName'] =  lastName;




  print(map);
  // try {
  http.Response response = await http.post(Uri.parse(ApiUrls.beneficiariesCreate+businessID),
      headers: { HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        "api-key": "m98zn3Y70MXGu1VaZNhYOZO7CbULj6uU"

      },
      body: jsonEncode(map));
  log("Sign IN DATA${response.body}");
  // http.Response response = await http.post(Uri.parse(ApiUrls.loginUser),
  //     headers: await getAuthHeader(),body: jsonEncode(map) );

  if (response.statusCode == 200) {

    print(jsonDecode(response.body));
    return CreateBenificiryModel.fromJson(jsonDecode(response.body));

  } else {

    print(jsonDecode(response.body));
    return CreateBenificiryModel(message: jsonDecode(response.body)["message"],success: false );
  }
  // }  catch (e) {
  //   Helpers.hideLoader(loader);
  //   return ModelCommonResponse(message: e.toString(), success: false);
}