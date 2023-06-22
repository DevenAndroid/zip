import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:zip/controller/bottomnavbar_controller.dart';
import 'package:zip/screens/bottom_nav_screens/send_cash1.dart';
import 'package:zip/screens/bottom_nav_screens/dashboard_screen.dart';
import 'package:zip/screens/profile_screen.dart';
import 'package:zip/screens/transaction1_page.dart';
import 'package:zip/screens/transaction_history.dart';
import 'package:zip/screens/wallet_screen.dart';


import 'package:zip/widgets/common_colour.dart';



class BottomNavbar extends StatefulWidget {
  const BottomNavbar({Key? key}) : super(key: key);

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  final bottomController = Get.put(BottomNavBarController());



  final pages = [
    const DashBoard(),
    TransactionsFirst(),
     WalletScreen(),
     ProfileScreen(),

  ];



  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(


        body: pages.elementAt(bottomController.pageIndex.value),
        extendBody: true,
        // extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        bottomNavigationBar: buildMyNavBar(context),
      );
    });
  }

  buildMyNavBar(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: double.maxFinite,
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 6.0,
              ),
            ],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: Column(
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: MaterialButton(
                      padding: const EdgeInsets.only(bottom: 10),
                      onPressed: () {
                       bottomController.updateIndexValue(0);

                      },

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                         bottomController. pageIndex.value == 0
                              ?  SvgPicture.asset('assets/images/home.svg',
                            color: AppTheme.secondaryColor,
                          )
                              : SvgPicture.asset('assets/images/home.svg',),


                          bottomController. pageIndex.value == 0
                              ?
                          Text("  Home",style: TextStyle(color: AppTheme.secondaryColor,fontSize: 15,fontWeight: FontWeight.w400),):Text("")

                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    child: MaterialButton(
                      padding: const EdgeInsets.only(bottom: 10),
                      onPressed: () {
                      bottomController.updateIndexValue(1);


                      },
                      child: Column(
                        children: [

                        bottomController. pageIndex.value == 1
                              ? SvgPicture.asset('assets/images/card.svg',
                            color: AppTheme.secondaryColor,
                          )
                              :  SvgPicture.asset('assets/images/card.svg',),


                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: MaterialButton(
                        padding: const EdgeInsets.only(bottom: 10),
                        onPressed: () {

                         bottomController.updateIndexValue(2);



                       },
                        child: Column(
                          children: [

                        bottomController.pageIndex.value == 2
                                ?  SvgPicture.asset('assets/images/Wallet.svg',
                              color: AppTheme.secondaryColor,
                            )
                                : SvgPicture.asset('assets/images/Wallet.svg',),

                          ],
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: MaterialButton(
                      padding: EdgeInsets.only(bottom: 10),
                      onPressed: () {
                       bottomController.updateIndexValue(3);
                      },
                      child: Column(
                        children: [

                         bottomController. pageIndex.value == 3
                              ?  SvgPicture.asset('assets/images/profile.svg',
                            color: AppTheme.secondaryColor,
                          )
                              : SvgPicture.asset('assets/images/profile.svg',),


                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
