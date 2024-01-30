import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../routers/my_routers.dart';
import '../widgets/common_button.dart';

class EligibleScreen extends StatefulWidget {
  const EligibleScreen({Key? key}) : super(key: key);

  @override
  State<EligibleScreen> createState() => _EligibleScreenState();
}

class _EligibleScreenState extends State<EligibleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: const AssetImage(
                "assets/images/loan.png",
              ))),
      child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 7,
                ),
                InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(
                      Icons.clear,
                      size: 25,
                    )),
                const SizedBox(
                  height: 100,
                ),
                const SizedBox(
                  height: 60,
                ),
                Center(
                  child: Text(
                    "Thanks for your \ninterest in ZIP loans",
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Text(
                    "Please bear with us while we work on your application in the background. We aim to get back to you with a decision in 48 hours.",
                    style: GoogleFonts.poppins(
                        color: const Color(0xFF6C6C6C),
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .45,
                ),
                InkWell(
                    onTap: () {
                      Get.toNamed(MyRouters.bottomNavbar);
                      // emailLogin();
                      //
                    },
                    child: const CustomOutlineButton(
                      title: "Return To Home",
                    )),
                const SizedBox(
                  height: 15,
                ),
              ])),
    )));
  }
}
