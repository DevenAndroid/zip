import 'package:get/get.dart';

import '../models/model_apply_loan.dart';
import '../repository/apply_loan_repo.dart';
import '../resourses/api_constant.dart';
import '../routers/my_routers.dart';

class LoanController extends GetxController {
  int selectedValue = 1;

  String dropdownvalue = 'Government Employed';
  String selectedValuem = "Home owner";
  String selectedValuem1 = "0 Naira to 1 Naira";
  String selectedValuem2 = "1 month to 6 month";
  String selectedValuem3 = "0 Naira to 1 Naira";
  String selectedValuem4 = "Yes";

  Rx<RxStatus> statusOfLoan = RxStatus.empty().obs;
  Rx<ModelApplyLoan> modelLoan = ModelApplyLoan().obs;

  loan(context) {
    loanRepo(
      desired_amount: selectedValuem3,
      duration_of_loan: selectedValuem2,
      employed_status: dropdownvalue,
      increament: selectedValuem4 == "yes" ? 1 : 0,
      loan_purpose: selectedValue,
      monthly_income: selectedValuem1,
      residential_status: selectedValuem,
      context: context,
    ).then((value) {
      modelLoan.value = value;
      if (value.status == true) {
        Get.toNamed(MyRouters.eligibleScreen);
        statusOfLoan.value = RxStatus.success();
        showToast(value.message.toString());
      } else {
        statusOfLoan.value = RxStatus.error();
        showToast(value.message.toString());
      }
    });
  }
}
