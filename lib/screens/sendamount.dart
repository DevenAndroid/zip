import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
          "Send Money",
          style: GoogleFonts.poppins(
              color: const Color(0xFF1D1D1D),
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 28.0, right: 10, left: 10),
        child: InkWell(
          onTap: () async {
            SharedPreferences pref = await SharedPreferences.getInstance();
            if (pref.getBool('TransistionPin') == true) {
              Get.toNamed(MyRouters.sendMoneyPin);
            } else {
              Get.toNamed(MyRouters.sendSuccessScreen);
            }
          },
          child: const CustomOutlineButton(
            title: "Continue",
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "You Send ",
                style: GoogleFonts.poppins(
                    color: const Color(0xFF1D1D1D),
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              Image.network(
                "https://cdn-icons-png.flaticon.com/512/32/32974.png",
                color: Colors.black,
                width: 15,
                height: 15,
              ),
              Text(
                '${profileController.amountController.text.toString()}',
                style: GoogleFonts.poppins(
                    color: const Color(0xFF1D1D1D),
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
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
