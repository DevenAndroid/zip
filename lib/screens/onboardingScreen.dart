import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:zip/routers/my_routers.dart';

import 'package:zip/widgets/common_boder_button.dart';
import 'package:zip/widgets/common_button.dart';
import 'package:zip/widgets/common_colour.dart';

import 'onboarding_list.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController controller = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(

      backgroundColor:  Colors.white10,

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            SizedBox(
              height: size.height*.83,
              width: size.width,
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
                        child: Container(
                          height: size.height,
                          width: size.width,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,

                              image: AssetImage(
                                page1[index].img,

                              ),
                            )
                          ),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          SizedBox(height: size.height*.55,),
                                          Center(
                                            child: Text(
                                              page1[index].title,
                                              style: GoogleFonts.poppins(
                                                  color:  Colors.white,

                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Center(
                                            child: Text(
                                              page1[index].description,
                                              style: GoogleFonts.poppins(
                                                  color:  Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w300),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),

                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SmoothPageIndicator(
                                                axisDirection: Axis.horizontal,
                                                controller: controller,
                                                count: page1.length,
                                                effect: const WormEffect(
                                                  activeDotColor:
                                                      Color(0xFFF0D75F),
                                                  dotWidth: 10,
                                                  dotHeight: 10,
                                                  dotColor: Colors.grey,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 12,
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),

                                        ])),

                              ]),
                        ));
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 7.0,right: 7),
              child: InkWell(
                  onTap: () {
                    Get.toNamed(MyRouters.enterEmailScreen);
                  },
                  child: const CustomOutlineButton(
                    title: "Sign up for free account",
                  )),
            ),
            const SizedBox(
              height: 15,
            ),
            InkWell(
                onTap: () {
                  Get.toNamed(MyRouters.emailLoginScreen);
                },
                child: const CustomOutlineBoder1(
                    title: "Already have an account",
                    backgroundColor: Colors.white,

                    textColor: AppTheme.buttonColor)),
          ],
        ),
      ),
    );
  }
}
