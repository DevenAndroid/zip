import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zip/routers/my_routers.dart';

import '../controller/profile_controller.dart';
import '../widgets/common_button.dart';

class RequestPaymentContiune extends StatefulWidget {
  const RequestPaymentContiune({Key? key}) : super(key: key);

  @override
  State<RequestPaymentContiune> createState() => _RequestPaymentContiuneState();
}

class _RequestPaymentContiuneState extends State<RequestPaymentContiune> {
  final profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Send Money",
          style: GoogleFonts.poppins(
              color: const Color(0xFF1D1D1D),
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 28.0),
        child: InkWell(
          onTap: () async {
            SharedPreferences pref = await SharedPreferences.getInstance();
            if (pref.getBool('TransistionPin') == true) {
              Get.toNamed(MyRouters.sendMoneyPin);
            } else {
              Get.toNamed(MyRouters.sendSuccessScreen);
            }
          },
          child: CustomOutlineButton(
            title: "Continue",
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 48,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              'assets/images/right.png',
              height: 121,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Center(
            child: Text(
              "Send Money \$ " + profileController.amountController.text.trim(),
              style: GoogleFonts.poppins(
                  color: const Color(0xFF1D1D1D),
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Text(
            "To" + "  ${profileController.nameController.text.toString()} ",
            style: GoogleFonts.poppins(
                color: const Color(0xFF1D1D1D),
                fontSize: 16,
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
