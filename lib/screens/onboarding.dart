import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:zip/resources.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/screens/onboarding_list.dart';
import 'package:zip/widgets/common_boder_button.dart';
import 'package:zip/widgets/common_button.dart';
class OBScreen extends StatefulWidget {
  const OBScreen({Key? key}) : super(key: key);

  @override
  State<OBScreen> createState() => _OBScreenState();
}

class _OBScreenState extends State<OBScreen> {
  PageController controller = PageController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return  Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SingleChildScrollView(
        child: Column(
          children: [

    SizedBox(
      height: size.height*.8,
      child: PageView.builder(
      itemCount: page1.length,
      controller: controller,
      onPageChanged: (newValue) {
      setState(() {
      currentIndex = newValue;
      });
      },
      itemBuilder: (context, index) {
      return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 8),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(

          height: 50,
        ),
      Image(
      image: AssetImage(page1[index].img,),
      ),


      const SizedBox(

      height: 20,
      ),
      Padding(padding: const EdgeInsets.symmetric(horizontal: 15),
      child :Column(
      children: <Widget>[
        const SizedBox(

          height: 18,
        ),
      Text(
      page1[index].title,
         style:GoogleFonts.poppins(
        color:  const Color(
        0xFF1D1D1D),
        fontSize: 30,
        fontWeight:
        FontWeight
            .bold),
      textAlign: TextAlign.center,
      ),
      const SizedBox(

      height: 18,
      ),
      Text(
      page1[index].description,
        style:GoogleFonts.poppins(
            color:  const Color(
                0xFF1D1D1D),
            fontSize: 20,
            fontWeight:
            FontWeight
                .w300),
      textAlign: TextAlign.center,
      ),
        const SizedBox(

          height: 22,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SmoothPageIndicator(

              axisDirection: Axis.horizontal,
              controller: controller,
              count: page1.length,
              effect: const WormEffect(
                activeDotColor: Color(0xFFF0D75F),
                dotWidth: 10,
                dotHeight: 10,
                dotColor: Colors.grey,
              ),
            ),
          ],
        ),
      ]))]));}),
    ),
            const SizedBox(
              height: 10,
            ),

        InkWell(
            onTap: (){
              Get.toNamed(MyRouters.mobileNumber);
            },
            child: CustomOutlineButton(title: "Open free account",)),
           SizedBox(height: 15,),
           const CustomOutlineBoder(title: "I have an account", backgroundColor: Colors.white,textColor: AppTheme.buttonColor),


          ],
        ),
      ),
    );
  }
}
