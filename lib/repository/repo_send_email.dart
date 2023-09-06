import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../models/model_send_email.dart';
import '../models/model_send_money.dart';
import '../models/model_update_user.dart';
import '../resourses/api_constant.dart';
import '../resourses/helper.dart';



Future<ModelSendEmail> sendEmailRepo({email,amount,context}) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var map = <String, dynamic>{};
  map['email'] =  email;
  map['amount'] = amount;



  print(map);
  try {
    http.Response response = await http.post(Uri.parse(ApiUrls.sendEmail),
        headers: await getAuthHeader(),body: jsonEncode(map) );

    if (response.statusCode == 200) {
      Helpers.hideLoader(loader);
      print(jsonDecode(response.body));
      return  ModelSendEmail.fromJson(jsonDecode(response.body));

    } else {
      Helpers.hideLoader(loader);
      print(jsonDecode(response.body));
      return ModelSendEmail(message: jsonDecode(response.body)["message"], status: false);
    }
  }  catch (e) {
    Helpers.hideLoader(loader);
    return  ModelSendEmail(message: e.toString(), status: false);
  }
}
