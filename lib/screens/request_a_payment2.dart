import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zip/routers/my_routers.dart';

import '../controller/profile_controller.dart';
import '../widgets/common_button.dart';

class RequestAPaymentContiune2 extends StatefulWidget {
  const RequestAPaymentContiune2({Key? key}) : super(key: key);

  @override
  State<RequestAPaymentContiune2> createState() =>
      _RequestAPaymentContiune2State();
}

class _RequestAPaymentContiune2State extends State<RequestAPaymentContiune2> {
  final profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
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
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                'assets/images/right.png',
                height: 121,
              ),
            ),
            const SizedBox(
              height: 25,
            ),

            Text(
              "You requested \$ ${profileController.amountController.text.trim()}",
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
            InkWell(
              onTap: () async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                if (pref.getBool('TransistionPin') == true) {
                  Get.toNamed(MyRouters.securityOtpScreen1);
                } else {
                  Get.toNamed(MyRouters.success2Screen);
                }
              },
              child: const CustomOutlineButton(
                title: "Continue",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
