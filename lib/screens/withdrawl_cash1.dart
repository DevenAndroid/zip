import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zip/routers/my_routers.dart';

import '../controller/payout_controller.dart';
import '../controller/profile_controller.dart';
import '../controller/update_user.dart';
import '../models/model_create_payout.dart';
import '../repository/payout_repo.dart';
import '../resourses/api_constant.dart';
import '../widgets/common_button.dart';

class WithdrawlCash extends StatefulWidget {
  const WithdrawlCash({Key? key}) : super(key: key);

  @override
  State<WithdrawlCash> createState() => _WithdrawlCashState();
}

class _WithdrawlCashState extends State<WithdrawlCash> {
  final profileController = Get.put(ProfileController());
  final controller = Get.put(registerController());
  final payOutcontroller = Get.put(PayoutController());

  Future CreatePayout() async {
    Rx<RxStatus> statusOfpayout = RxStatus.empty().obs;
    Rx<ModelPayout> payout = ModelPayout().obs;
    payoutRepo(
            amount: profileController.result5.toString().trim(),
            context: context,
            bank_code: controller.idController1.text.toString(),
            user_id:
                profileController.modal.value.data!.user!.id.toString().trim(),
            key: "payouts",
            accountHolderName:
                payOutcontroller.accountName.text.trim().toString(),
            accountNumber: payOutcontroller.accountNo.text.trim(),
            destinationCurrency: "NGN",
            about: "Cash Out",
            customerReference: DateFormat.jm().format(DateTime.now()),
// RegistorController.descriptionController.text.trim(),
// destinationCurrencyController.text.trim() ,
            sourceCurrency: "NGN",
            // sourceCurrencyController.text.trim(),
            description: DateFormat.jm().format(DateTime.now()),
            // email:data.email.toString(),
            firstName: controller.bankController1.text.trim(),
            // lastName:data.lastName.toString() ,
            paymentDestination: "bank_account",
            type: "individual",
            business: details.businessID)
        .then((value) {
      payout.value = value;
      if (value.success == true) {
        statusOfpayout.value = RxStatus.success();
        // saveList();
        Get.toNamed(MyRouters.success3Screen);
        // Get.back();
        showToast(value.message.toString());
      } else {
        statusOfpayout.value = RxStatus.success();
        showToast(value.message.toString());
      }
      // showToast(value.message.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: Colors.grey.shade300,
            height: 1.0,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Cash Out",
          style: GoogleFonts.poppins(
              color: const Color(0xFF1D1D1D),
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 48,
            ),
            Center(
              child: SvgPicture.asset(
                'assets/images/verify.svg',
                height: 90,
                width: 90,
              ),
            ),
            const SizedBox(
              height: 25,
            ),

            Text(
              "You requested \$ ${profileController.result5.trim()}",
              style: GoogleFonts.poppins(
                  color: const Color(0xFF1D1D1D),
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            // Text(
            //   "From  ${profileController.modal.value.data!.user!.fname.toString()}  ${profileController.modal.value.data!.user!.lname.toString()}",
            //   style: GoogleFonts.poppins(
            //       color: const Color(0xFF1D1D1D),
            //       fontSize: 16,
            //       fontWeight: FontWeight.w400),
            // ),
            SizedBox(
              height: size.height * .4,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () async {
                  SharedPreferences pref =
                      await SharedPreferences.getInstance();
                  if (pref.getBool('TransistionPin') == true) {
                    Get.toNamed(MyRouters.securityOtpScreen1);
                  } else {
                    // print(payOutcontroller.accountNo.text.trim().toString());
                    CreatePayout();
                  }
                },
                child: const CustomOutlineButton(
                  title: "Continue",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
