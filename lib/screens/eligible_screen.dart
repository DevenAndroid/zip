import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    return  Scaffold(

        body: SingleChildScrollView(
        child: Padding(
        padding: const EdgeInsets.all(20.0),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    SizedBox(height: 7,),
    InkWell(
    onTap: (){
    Get.back();
    },
    child:Icon(Icons.clear,size: 25,)),
    SizedBox(height: 80,),
SvgPicture.asset('assets/images/cross.svg'),
      SizedBox(height: 30,),
    Center(
      child: Text(
      "Thanks for your \ninterest in ZIP loans",
      style: GoogleFonts.poppins(
      color: const Color(0xFFBA8C31),
      fontSize: 25,
      fontWeight: FontWeight.w600),
        textAlign: TextAlign.center,

      ),
    ),
      SizedBox(height: 12,),
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


      SizedBox(height: MediaQuery.of(context).size.height*.4,),
      InkWell(
          onTap: (){
            Get.toNamed(MyRouters.bottomNavbar);
            // emailLogin();
            //
          },
          child: CustomOutlineButton(title: "Return To Home",)),
      SizedBox(height: 15,),

    ]
    )))


    );
  }
}
