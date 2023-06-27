import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../models/model_update_user.dart';
import '../resourses/api_constant.dart';
import '../resourses/helper.dart';



Future<ModelUpdateUser> userUpdateRepo({fname,lname,dob,nationality,pin,context,birth_place,gender,zip_tag}) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var map = <String, dynamic>{};
  map['primary_purpose'] = "Family Support";
  map['fname'] = fname;
  map['lname'] = lname;
  map['dob'] = dob;
  map['nationality'] = nationality;
  map['pin'] = pin;
  map['birth_place'] = birth_place;
  map['gender'] = gender;
  map['zip_tag'] = zip_tag;


  print(map);
  try {
    http.Response response = await http.post(Uri.parse(ApiUrls.updateDetails),
        headers: await getAuthHeader()
        ,body: jsonEncode(map) );

    if (response.statusCode == 200) {
      Helpers.hideLoader(loader);
      print(jsonDecode(response.body));
      return  ModelUpdateUser.fromJson(jsonDecode(response.body));

    } else {
      Helpers.hideLoader(loader);
      print(jsonDecode(response.body));
      return ModelUpdateUser(message: jsonDecode(response.body)["message"], status: false);
    }
  }  catch (e) {
    Helpers.hideLoader(loader);
    return  ModelUpdateUser(message: e.toString(), status: false);
  }
}
