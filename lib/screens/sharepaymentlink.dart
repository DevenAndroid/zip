import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

import '../controller/update_user.dart';
import '../routers/my_routers.dart';
import '../widgets/common_button.dart';

class SharePaymentLink extends StatefulWidget {
  const SharePaymentLink({Key? key}) : super(key: key);

  @override
  State<SharePaymentLink> createState() => _SharePaymentLinkState();
}

class _SharePaymentLinkState extends State<SharePaymentLink> {
  final register = Get.put(registerController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () {
                Share.share(register.link1.value.toString());
                // Get.toNamed(MyRouters.bottomNavbar);
              },
              child: const CustomOutlineButton(
                title: "Share payment link",
              ),
            ),
            SizedBox(height: 20,),
            InkWell(
                onTap: () {
                  Get.offAllNamed(MyRouters.bottomNavbar);
                },
                child: const CustomOutlineButton(
                  title: "Go To Home ",
                )),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 140,
            ),
            Image.asset(
              'assets/images/linkicon.png',
              height: 51,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Payment link has been generated",
              style: GoogleFonts.poppins(
                  color: const Color(0xFF1D1D1D),
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                "After it is paid, you will receive payment immediately",
                style: GoogleFonts.poppins(
                    color: const Color(0xFF1D1D1D),
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
            ),

            // Center(
            //   child: Text(
            //     "Link "+register.link1.toString(),
            //     style: GoogleFonts.poppins(
            //         color: const Color(0xFF1D1D1D),
            //         fontSize: 16,
            //         fontWeight: FontWeight.w400),textAlign: TextAlign.center,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
