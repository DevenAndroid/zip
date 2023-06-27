import 'package:get/get.dart';

import '../models/model_choose_bank.dart';
import '../repository/choose_bank_repo.dart';
import '../resourses/api_constant.dart';



class BankController extends GetxController {


  Rx<RxStatus> statusOfChooseBank = RxStatus
      .empty()
      .obs;

  Rx<ChooseBankList> chooseBank = ChooseBankList().obs;


  ChooseBankApi() {
    chooseBankRepo("/${"NG"}",).then((value) {
      chooseBank.value = value;

      if (value.status == true) {
        statusOfChooseBank.value = RxStatus.success();
      } else {
        statusOfChooseBank.value = RxStatus.error();
      }
      // if(value.status=="success"){
      //   statusOfChooseBank.value.isSuccess;
      // }
      // Get.toNamed(MyRouters.bottomNavbar);


      showToast(value.message.toString());
    });
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    ChooseBankApi();
  }

}


