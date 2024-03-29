import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_button.dart';

class ConfirmBank extends StatefulWidget {
  const ConfirmBank({Key? key}) : super(key: key);

  @override
  State<ConfirmBank> createState() => _ConfirmBankState();
}

class _ConfirmBankState extends State<ConfirmBank> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: size.height * .1,
                      ),
                      Center(
                        child: Text(
                          "Confirm you want to cash out to:",
                          style: GoogleFonts.poppins(
                              color: const Color(0xFF1D1D1D),
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      const SizedBox(
                        height: 45,
                      ),
                      Center(
                        child: SvgPicture.asset(
                          'assets/images/bank.svg',
                          height: 75,
                          width: 75,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Center(
                        child: Text(
                          "Adedoyin, Daniel (Guaranty trust bank 1234)",
                          style: GoogleFonts.poppins(
                              color: const Color(0xFF1D1D1D),
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: size.height * .5,
                      ),
                      InkWell(
                          onTap: () {
                            Get.toNamed(MyRouters.successScreen);
                          },
                          child: const CustomOutlineButton(
                            title: "Confirm",
                          )),
                    ]))));
  }
}
