import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../models/login_model.dart';
import '../models/modal_registor.dart';
import '../models/model_save_africa_details.dart';
import '../resourses/api_constant.dart';
import '../resourses/helper.dart';



Future<ModelSaveDetailsAfrica> africaDetailsRepo({

  email,
  gender,
  dob,
  phone,
  country,
  nin,
  bvn,
  nationality,
  full_name,
  first_name,
  last_name,
  middle_name,
  alternate_phone,
  state_of_origin,
  state_of_residence,
  lga_of_origin,
  lga_of_residence,
  address_line_2,
  address_line_3,
  marital_status,
  userid,
  avatar,
  context

}) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var map = <String, dynamic>{};



  map['user_id'] =              userid;
  map['email'] =              email;
  map['gender'] =             gender;
  map['dob'] =                dob;
  map['phone'] =              phone;
  map['country'] =            country;
  map['nin'] =                nin;
  map['bvn'] =                bvn;
  map['nationality'] =        nationality;
  map['full_name'] =          full_name;
  map['first_name'] =         first_name;
  map['last_name'] =          last_name;
  map['middle_name'] =        middle_name;
  map['alternate_phone'] =    alternate_phone;
  map['state_of_origin'] =    state_of_origin;
  map['state_of_residence'] = state_of_residence;
  map['lga_of_origin'] =      lga_of_origin;
  map['lga_of_residence'] =   lga_of_residence;
  map['address_line_2'] =     address_line_2;
  map['address_line_3'] =     address_line_3;
  map['marital_status'] =     marital_status;
  map['avatar'] =             avatar;



  print(map);
  // try {
  http.Response response = await http.post(Uri.parse(ApiUrls.africaVerificationUser),
      headers: await getAuthHeader(),
      body: jsonEncode(map));
  log("Sign IN DATA${response.body}");
  // http.Response response = await http.post(Uri.parse(ApiUrls.loginUser),
  //     headers: await getAuthHeader(),body: jsonEncode(map) );

  if (response.statusCode == 200) {
    Helpers.hideLoader(loader);
    print(jsonDecode(response.body));
    return ModelSaveDetailsAfrica.fromJson(jsonDecode(response.body));

  } else {
    Helpers.hideLoader(loader);
    print(jsonDecode(response.body));
    return ModelSaveDetailsAfrica(message: jsonDecode(response.body)["message"], );
  }
  // }  catch (e) {
  //   Helpers.hideLoader(loader);
  //   return ModelCommonResponse(message: e.toString(), success: false);
}