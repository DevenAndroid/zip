import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../models/login_model.dart';
import '../models/modal_registor.dart';
import '../models/update_setting_modal.dart';
import '../resourses/api_constant.dart';
import '../resourses/helper.dart';



Future<UpdateSettingModal> updateSettingRepo({hide_balance,context,enable_security_lock,transaction_pin,enable_fingerprints}) async {


  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var map = <String, dynamic>{};

  map['hide_balance'] = hide_balance;
  map['enable_security_lock'] =  enable_security_lock;
  map['transaction_pin'] = transaction_pin;
  map['enable_fingerprints'] = enable_fingerprints;

  var header = {
    HttpHeaders.contentTypeHeader: "application/json",
    HttpHeaders.acceptHeader: "application/json",
    HttpHeaders.authorizationHeader:
    'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5OTgwYzYwMy1iNTk2LTQyOWItOTkzOS1jNTE3YjdlZWZiY2EiLCJqdGkiOiI2YzdkYzQzNmJlOWI0NWI4Y2RkMWQwMzU0ZjUwYTY1YWU1MTkwNGJlNzYyMjg1YmI2ZWIxZDZmNmJlNTRhOWNmZTEwNzcwYmNlYzhiN2Y0ZSIsImlhdCI6MTY4ODM3MTE1Ny4zMzI4MTUsIm5iZiI6MTY4ODM3MTE1Ny4zMzI4MTksImV4cCI6MTcxOTk5MzU1Ny4zMjkwMjksInN1YiI6IjE0MyIsInNjb3BlcyI6W119.GtQQ89a6Sih_DCctCaElkBGwQR6Oe84beMsNryI1foCPIr24MSYBcASH5s1M-RPNtdS7UihPpPAfIy6aUeg5VVVQXwPm6fnA9KlnYLa_uf77C5a-4dYNTZi1ERsOctWBrrdZxi5FUrGV2JI4XWDebGvd2C5UPFkk0yhiqJvt2orblPzZnm3Z_HftLi6S9kfQTVOoTmkLTO9QQb1n__Fbq_Z3d5pwpicPIepCFbfalJB2bXe1_qbVSXub-xBaLqbICsrH14mEcnoL0CyMShohsQLX0vzNxMnMbbA0JN-67wdbU77_UZp46KbfA3Ky9Bl4WnRYMR-neTuqLsxBl2BqhnhB3Li498ZZU-F_vzZht482zs_gJ5KWcvfs4k-neA9G9ntTMV0hpGb3kHIyL_yH1obj8wwI_6_2SrBoLtDWJl0oTDdKuOR4lMXBAdubKm69jzBlr37z-vetYMFSlWHvmwqMGg8R85yDGkNOWAp39Z_U1g-2TGgK-ILOaNehwSmpjcqkVmpIguchjnOaSxp_-1TK4fx_njyIVvLWu_tsK0R7csIog2vSQkrxQ1tB6IVSl5-zUBlXMRe2ANZMY0r5IgX6m6SR8LXX0aaaRl8QnqPKDWCl0GAzmifB52VHjZvHdPMMonR7B_L3scR8EtZe1vC0wtrm5KGie6gGPHTRCr8',
  };

  print(map);
  // try {
  http.Response response = await http.post(Uri.parse(ApiUrls.updateSetting),
      headers: header,
      body: jsonEncode(map));
  log("Sign IN DATA${response.body}");
  // http.Response response = await http.post(Uri.parse(ApiUrls.loginUser),
  //     headers: await getAuthHeader(),body: jsonEncode(map) );

  if (response.statusCode == 200) {
    Helpers.hideLoader(loader);
    print(jsonDecode(response.body));
    return UpdateSettingModal.fromJson(jsonDecode(response.body));

  } else {
    Helpers.hideLoader(loader);
    print(jsonDecode(response.body));
    return UpdateSettingModal(message: jsonDecode(response.body)["message"], );
  }
  // }  catch (e) {
  //   Helpers.hideLoader(loader);
  //   return ModelCommonResponse(message: e.toString(), success: false);
}