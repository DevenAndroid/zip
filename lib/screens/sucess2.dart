import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/widgets/common_button.dart';

import '../controller/profile_controller.dart';

class Success2Screen extends StatefulWidget {
  const Success2Screen({Key? key}) : super(key: key);

  @override
  State<Success2Screen> createState() => _Success2ScreenState();
}

class _Success2ScreenState extends State<Success2Screen> {
  final profileController = Get.put(ProfileController());

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
                          "Success!",
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
                          'assets/images/verify.svg',
                          height: 90,
                          width: 90,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Center(
                        child: Text(
                          "Your cash out will be processed soon",
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
                            profileController.saveList1(context);
                          },
                          child: const CustomOutlineButton(
                            title: "Done",
                          )),
                    ]))));
  }
}
