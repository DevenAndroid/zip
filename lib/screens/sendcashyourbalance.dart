import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_colour.dart';

import '../controller/profile_controller.dart';
import '../widgets/common_button.dart';
import '../widgets/common_textfield.dart';

class SendCashYourBalance extends StatefulWidget {
  const SendCashYourBalance({Key? key}) : super(key: key);

  @override
  State<SendCashYourBalance> createState() => _SendCashYourBalanceState();
}

class _SendCashYourBalanceState extends State<SendCashYourBalance> {
  final profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Your Balance",
          style: GoogleFonts.poppins(
              color: const Color(0xFF1D1D1D),
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: (){
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_rounded,
            color: AppTheme.primaryColor,
          ),
        ),
      ),
      body:Obx(() { return profileController.currentBalanceModel.value.status ==true?

      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0,right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "\$"+profileController. currentBalanceModel.value.data.toString(),
                  style: GoogleFonts.poppins(
                      color: const Color(0xFF1D1D1D),
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ),
SizedBox(height: 20,),
              Text(
                "Cash Out to our prefferedpayment method ",
                style: GoogleFonts.poppins(
                    color: const Color(0xFF1D1D1D),
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),

              const SizedBox(
                height: 17,
              ),
              CommonTextfield(
                controller: profileController.amountController,
                obSecure: false,
                hintText: "200",
                labelText: "Amount",
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "This transaction is free",
                style: GoogleFonts.poppins(
                    color: const Color(0xFF1D1D1D),
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: size.height * .5,
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(MyRouters.selectMethod );
                },
                child: const Padding(
                  padding: EdgeInsets.only(left: 10, right: 8),
                  child: CustomOutlineButton(
                    title: "Send",
                  ),
                ),
              ),
            ],
          ),
        ),
      ): const Center(child: CircularProgressIndicator(),);
      }),
    );
  }
}
