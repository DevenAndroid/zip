import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import '../widgets/common_button.dart';

class SharePaymentLink extends StatefulWidget {
  const SharePaymentLink({Key? key}) : super(key: key);

  @override
  State<SharePaymentLink> createState() => _SharePaymentLinkState();
}

class _SharePaymentLinkState extends State<SharePaymentLink> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
     body:  Column(
       children: [
         SizedBox(height: 140,),
         Image.asset(
           'assets/images/linkicon.png',
           height: 51,
         ),
         SizedBox(
           height: 30,
         ),
         Text(
           "Payment link has been generated",
           style: GoogleFonts.poppins(
               color: const Color(0xFF1D1D1D),
               fontSize: 18,
               fontWeight: FontWeight.w500),
         ),

         Text(
           "After it is paid, ypu will receive payment imediately",
           style: GoogleFonts.poppins(
               color: const Color(0xFF1D1D1D),
               fontSize: 16,
               fontWeight: FontWeight.w400),
         ),
         SizedBox(
           height: size.height * .5,
         ),
         InkWell(
           onTap: () {
             Share.share('check out my website https://example.com', subject: 'Look what I made!');
           },
           child: CustomOutlineButton(
             title: "Share payment link",
           ),
         ),
       ],
     ),
    );
  }
}

