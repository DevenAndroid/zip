import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_button.dart';

import '../controller/profile_controller.dart';
class SuccessRequestScreen extends StatefulWidget {
  const SuccessRequestScreen({Key? key}) : super(key: key);

  @override
  State<SuccessRequestScreen> createState() => _SuccessRequestScreenState();
}

class _SuccessRequestScreenState extends State<SuccessRequestScreen> {
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
                      SizedBox(height: size.height*.1,),
                      Center(
                        child: Text(

                          "Success!",
                          style: GoogleFonts.poppins(
                              color: const Color(0xFF1D1D1D),
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(height: 45,),
                      Center(
                        child: Image.asset(
                          'assets/images/tick.png',height: 90,width: 90,),
                      ),
                      SizedBox(height: 25,),
                      Center(
                        child: Text(

                          "Your Request  is send  successful",
                          style: GoogleFonts.poppins(
                              color: const Color(0xFF1D1D1D),
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(height: size.height*.5,),
                      InkWell(
                          onTap: (){
                            Get.offAllNamed(MyRouters.bottomNavbar);

                          },
                          child: CustomOutlineButton(title: "Go To Home ",)),
                    ]
                ))));
  }
}
