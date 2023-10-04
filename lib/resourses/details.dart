import 'dart:developer';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../controller/profile_controller.dart';
import '../models/model_kay .dart';
import '../repository/get_all_kay_repo.dart';

class DetailsController extends GetxController {
  final profileController = Get.put(ProfileController());
  Rx<ModelKey> appKeyModel = ModelKey().obs;
  Rx<RxStatus> statusOfKey = RxStatus.empty().obs;
  String businessID = "";
  String publicKey= "";
  String secretKey= "";
  String apiKey= "";
  String testToken= "";
  getKey() {
    getKeyRepo(

    ).then((value) {

      log("response.body.....    ${value}");
      appKeyModel.value = value;
      if (value.status == true) {
         businessID = appKeyModel.value.data!.businessId.toString();
         publicKey  = appKeyModel.value.data!.publicKey.toString();
         secretKey  = appKeyModel.value.data!.secretKey.toString();
         apiKey     = appKeyModel.value.data!.apiKey.toString();
         testToken  = appKeyModel.value.data!.token.toString();
        statusOfKey.value = RxStatus.success();
      } else {
        statusOfKey.value = RxStatus.error();
      }
    }
      // showToast(value.message.toString());
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