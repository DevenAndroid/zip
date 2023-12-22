import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controller/profile_controller.dart';
import '../models/login_model.dart';
import '../models/model_kay .dart';
import '../models/model_otp.dart';
import '../repository/get_all_kay_repo.dart';
import '../repository/login_repo.dart';
import '../repository/otp_repo.dart';
import '../routers/my_routers.dart';
import 'api_constant.dart';

class DetailsController extends GetxController {
  final profileController = Get.put(ProfileController());
  Rx<ModelKey> appKeyModel = ModelKey().obs;
  Rx<RxStatus> statusOfKey = RxStatus.empty().obs;





  String businessID = "64529bd2bfdf28e7c18aa9da";
  //String businessID = "645f9404bc81847c40e448a0";
  String publicKey= "pk_NjQ1Zjk0MDRiYzgxODQ3YzQwZTQ0OGEwOjoxOTg1OTI=";
  String secretKey= "16GH53GI9AzB17ov5QCgk1kw9m2uIGf3";
  //////////api keys
  //  String apiKey=    "16GH53GI9AzB17ov5QCgk1kw9m2uIGf3";
   String apiKey=    "m98zn3Y70MXGu1VaZNhYOZO7CbULj6uU";
  //////////
  String testToken= "Bearer at_test_a1f95e5af450d1d490e4b3a80ee50d44a0c058632a514fabf123cd211f1daf7e7bd09da169ee060746b95de5484018707c83f3327e5d4131eef112969af2fa1a2d1e9f9f932dbbb8ceef7e6ca3af1a0af1157188f3c2d05d68623bfed1e085fe907237d85d403d41c97334667cf3d656e7e4bc874565dafe466f4d1f109bb2dbaca43b1eb1de8cc38849c0d96d936d66602cb24474bd43a9ff4db139b82faadd6523d5137f72b5dc0637225b665016c436e8b4a3b0548aade184bd2cc2ef19990c4965c13ef7cdb0058202aa1ee85aa87faec1776853b5c0c880d911425fe075ef5c35be6e683ea58c186f48278ae430c038432092b4c12f7755c52aad7b81b1";
  String Authorization= "Token token=OYZdKwC9r8hwCb7yUXu2BA";
  getKey() {
    getKeyRepo(

    ).then((value) {
      log("response.body.....    ${value}");
      appKeyModel.value = value;
      if (value.status == true) {
        // businessID = appKeyModel.value.data!.businessId.toString();
         businessID = "64529bd2bfdf28e7c18aa9da";
         //   businessID = "645f9404bc81847c40e448a0";
         publicKey  = "pk_NjQ1Zjk0MDRiYzgxODQ3YzQwZTQ0OGEwOjoxOTg1OTI=";
         secretKey  ="16GH53GI9AzB17ov5QCgk1kw9m2uIGf3";
         //////////api keys
         //   apiKey=    "16GH53GI9AzB17ov5QCgk1kw9m2uIGf3";
         apiKey=    "m98zn3Y70MXGu1VaZNhYOZO7CbULj6uU";
         //////////
         testToken  = "Bearer at_test_a1f95e5af450d1d490e4b3a80ee50d44a0c058632a514fabf123cd211f1daf7e7bd09da169ee060746b95de5484018707c83f3327e5d4131eef112969af2fa1a2d1e9f9f932dbbb8ceef7e6ca3af1a0af1157188f3c2d05d68623bfed1e085fe907237d85d403d41c97334667cf3d656e7e4bc874565dafe466f4d1f109bb2dbaca43b1eb1de8cc38849c0d96d936d66602cb24474bd43a9ff4db139b82faadd6523d5137f72b5dc0637225b665016c436e8b4a3b0548aade184bd2cc2ef19990c4965c13ef7cdb0058202aa1ee85aa87faec1776853b5c0c880d911425fe075ef5c35be6e683ea58c186f48278ae430c038432092b4c12f7755c52aad7b81b1";
        statusOfKey.value = RxStatus.success();
      } else {
        statusOfKey.value = RxStatus.error();
      }
    }
      // showToast(value.message.toString());
    );
  }
  final formKey2 = GlobalKey<FormState>();
  Rx<RxStatus> statusOflogin = RxStatus.empty().obs;
  Rx<LoginModel> login = LoginModel().obs;
  final formKeylogin = GlobalKey<FormState>();
  TextEditingController emailNoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();



  Email(context) async {
    String? token = await FirebaseMessaging.instance.getToken();
print(token);
      loginRepo(
          context: context,
          password:passwordController.text.trim(),
          phone_email:emailNoController.text.trim(),
          type: "email",
device_token: token,
      ).then((value) async {
        login.value = value;
        if (value.status == true) {
          SharedPreferences pref = await SharedPreferences.getInstance();

          pref.setString('business_id', login.value.data!.businessId.toString());
          pref.setString('cookie', value.authToken.toString());
          Get.offAllNamed(MyRouters.loginPinScreen,arguments: [emailNoController.text.trim()]);
          // Get.offAllNamed(MyRouters.bottomNavbar);
          statusOflogin.value = RxStatus.success();
          showToast(value.message.toString());
        } else {
          statusOflogin.value = RxStatus.error();
          showToast(value.message.toString());


        }
      }

      );

  }












  TextEditingController mobileNoController = TextEditingController();
  TextEditingController nopasswordController = TextEditingController();
  // var initStateBlank = Get.arguments[0];
  final formKey13 = GlobalKey<FormState>();


  Login(context) {


      loginRepo(
          context: context,
          password:nopasswordController.text.trim(),
          phone_email:"+234"+mobileNoController.text.trim(),
          type: "phone"
      ).then((value) async {
        login.value = value;
        if (value.status == true) {
          SharedPreferences pref = await SharedPreferences.getInstance();
          pref.setString('cookie', value.authToken.toString());
          Get.offAllNamed(MyRouters.loginNoPinScreen,arguments: ["+234"+mobileNoController.text.trim()]);
          // Get.offAllNamed(MyRouters.bottomNavbar);
          statusOflogin.value = RxStatus.success();
          showToast(value.message.toString());
        } else {
          statusOflogin.value = RxStatus.error();
          showToast(value.message.toString());
        }
      }

      );

  }






 @override
 void onInit() {
   // TODO: implement onInit
   super.onInit();
   getKey();
 }





  // String businessID = '71f5b829d01e464281deb3e9';
  // String publicKey = 'Fincra_W5QVAR98SYN2L';
  // String secretKey = 'Fincra_SECRET5DU6381AGQK7N';
  // String apiKey = 'm98zn3Y70MXGu1VaZNhYOZO7CbULj6uU';
  // String testToken = "Bearer at_test_a1f95e5af450d1d490e4b3a80ee50d44a0c058632a514fabf123cd211f1daf7e7bd09da169ee060746b95de5484018707c83f3327e5d4131eef112969af2fa1a2d1e9f9f932dbbb8ceef7e6ca3af1a0af1157188f3c2d05d68623bfed1e085fe907237d85d403d41c97334667cf3d656e7e4bc874565dafe466f4d1f109bb2dbaca43b1eb1de8cc38849c0d96d936d66602cb24474bd43a9ff4db139b82faadd6523d5137f72b5dc0637225b665016c436e8b4a3b0548aade184bd2cc2ef19990c4965c13ef7cdb0058202aa1ee85aa87faec1776853b5c0c880d911425fe075ef5c35be6e683ea58c186f48278ae430c038432092b4c12f7755c52aad7b81b1";


}