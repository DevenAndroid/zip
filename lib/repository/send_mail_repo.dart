import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../models/model_send_money.dart';
import '../models/model_update_user.dart';
import '../resourses/api_constant.dart';
import '../resourses/helper.dart';



Future<ModelSendMail> sendMailRepo({zip_user_id,amount,type,}) async {

  var map = <String, dynamic>{};
  map['zip_user_id'] =  zip_user_id;
  map['amount'] = amount;
  map['type'] = type;


  print(map);
  try {
    http.Response response = await http.post(Uri.parse(ApiUrls.requestmail),
        headers: await getAuthHeader(),body: jsonEncode(map) );

    if (response.statusCode == 200) {

      print(jsonDecode(response.body));
      return  ModelSendMail.fromJson(jsonDecode(response.body));

    } else {

      print(jsonDecode(response.body));
      return ModelSendMail(message: jsonDecode(response.body)["message"], status: false);
    }
  }  catch (e) {

    return  ModelSendMail(message: e.toString(), status: false);
  }
}
