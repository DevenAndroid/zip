import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/screens/update_profile_screen.dart';
import 'package:zip/widgets/common_colour.dart';

import '../controller/profile_controller.dart';
import '../models/myprofile_model.dart';
import '../repository/myprofile_repo.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  final profileController = Get.put(ProfileController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() {
    myProfileRepo().then((value) {
      profileController.modal.value = value;
      if (value.status == true) {
        print(value.message.toString());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Profile",
          style: GoogleFonts.poppins(
              color: const Color(0xFF1D1D1D),
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ),
         leading: InkWell(
           onTap: () {
             Get.toNamed(MyRouters.bottomNavbar);
           },
           child: const SizedBox()
         ),
        centerTitle: true,
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.only(right: 20),
        //     child: Container(
        //       height: 27,
        //       width: 27,
        //       decoration: BoxDecoration(
        //
        //           borderRadius: BorderRadius.circular(5)),
        //       child: Padding(
        //         padding: const EdgeInsets.all(6.0),
        //         child: Image.asset("assets/images/link.png",),
        //       ),
        //     ),
        //   )
        // ],
      ),
      body: Obx(() {
        if (profileController.modal.value.status==true&& profileController.currentBalanceModel.value.status ==true) {
          return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20,),
              Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                          Radius.circular(100)),
                      color: AppTheme.primaryColor,
                    ),
                    child: ClipOval(
                      child: CachedNetworkImage(
                        width: 120,
                        height: 120,
                        fit: BoxFit.cover,
                        imageUrl: profileController.modal.value.data!.user!.profileImage.toString(),
                        placeholder: (context, url) =>
                        const SizedBox(),
                        errorWidget: (context, url, error) =>
                        const SizedBox(),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(MyRouters.profileUpdateScreen);
                      },
                      child: Container(
                        padding:
                        const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle),
                        child: Container(
                          padding:
                          const EdgeInsets.all(
                              5),
                          decoration:
                          BoxDecoration(
                              color: const Color(
                                  0xffF0D75F),
                              borderRadius: BorderRadius.circular(5)),
                          child: Icon(
                            Icons.edit,
                            color: Colors.black,
                            size:
                            size.height * .015,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
           SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    profileController.modal.value.data!.user!.fname.toString(),
                    style: GoogleFonts.poppins(
                        color: const Color(0xFF1D1D1D),
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    profileController.modal.value.data!.user!.lname.toString(),
                    style: GoogleFonts.poppins(
                        color: const Color(0xFF1D1D1D),
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              Text(
                profileController.modal.value.data!.user!.zipTag.toString(),
                style: GoogleFonts.poppins(
                    color: const Color(0xFF1D1D1D),
                    fontSize: 16,
                    fontWeight: FontWeight.w300),
              ),
              const SizedBox(
                height: 16,
              ),
              const Divider(
                thickness: 1,
                color: Color(0x1A000000),
              ),
              const SizedBox(
                height: 21,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "Current Balance",
                      style: GoogleFonts.poppins(
                          color: const Color(0xFF1D1D1D),
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child:  Row(
                      children: [
                        Image.network("https://cdn-icons-png.flaticon.com/512/32/32974.png",color: Colors.black,width: 15,height: 15,),

                        Text(
                        profileController.currentBalanceModel.value.data!.currentBalance.toString(),
                          style: GoogleFonts.poppins(
                              color: const Color(0xFF1D1D1D),
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        ),],
                    ),
                  ),

                ],
              ),
              const SizedBox(height: 23,),
              const Divider(
                thickness: 5,
                color: Color(0x1A000000),
              ),
              const SizedBox(height: 12,),
              // InkWell(
              //   onTap: () {
              //     Get.toNamed(MyRouters.addAPayer);
              //   },
              //   child: Row(
              //     children: [
              //       const SizedBox(
              //         width: 20,
              //       ),
              //       Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text(
              //             "Add Cash",
              //             style: GoogleFonts.poppins(
              //                 color: const Color(0xFF1D1D1D),
              //                 fontSize: 13,
              //                 fontWeight: FontWeight.w400),
              //           ),
              //           Text(
              //             "Transfer cash from your bank into ZIP",
              //             style: GoogleFonts.poppins(
              //                 color: const Color(0xFF1D1D1D),
              //                 fontSize: 9,
              //                 fontWeight: FontWeight.w300),
              //           ),
              //         ],
              //       ),
              //       const Spacer(),
              //
              //       const Icon(Icons.arrow_forward_ios, size: 15,),
              //       const SizedBox(
              //         width: 20,
              //       ),
              //     ],
              //   ),
              // ),
              // const SizedBox(height: 12,),
              // const Divider(
              //   thickness: 1,
              //   color: Color(0x1A000000),
              // ),
              // const SizedBox(height: 12,),
              // InkWell(
              //   onTap: () {
              //     Get.toNamed(MyRouters.yourBalanceScreen);
              //   },
              //   child: Row(
              //     children: [
              //       const SizedBox(
              //         width: 20,
              //       ),
              //       Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text(
              //             "Cash Out",
              //             style: GoogleFonts.poppins(
              //                 color: const Color(0xFF1D1D1D),
              //                 fontSize: 13,
              //                 fontWeight: FontWeight.w400),
              //           ),
              //           Text(
              //             "Transfer cash from ZIP into your",
              //             style: GoogleFonts.poppins(
              //                 color: const Color(0xFF1D1D1D),
              //                 fontSize: 9,
              //                 fontWeight: FontWeight.w300),
              //           ),
              //         ],
              //       ),
              //       const Spacer(),
              //
              //       const Icon(Icons.arrow_forward_ios, size: 15,),
              //       const SizedBox(
              //         width: 20,
              //       ),
              //     ],
              //   ),
              // ),
              // const SizedBox(height: 12,),
              // const Divider(
              //   thickness: 1,
              //   color: Color(0x1A000000),
              // ),
              InkWell(
                onTap: (){
                  Get.toNamed(MyRouters.personalScreen);
                },
                child: Row(
                  children: [
                    const SizedBox(
                      width: 21,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Personal",
                          style: GoogleFonts.poppins(
                              color: const Color(0xFF1D1D1D),
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "Sign into your account using multiple  phone numbers \n and email",
                          style: GoogleFonts.poppins(
                              color: const Color(0xFF1D1D1D),
                              fontSize: 11,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    const Spacer(),

                    const Icon(Icons.arrow_forward_ios, size: 15,),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12,),
              const Divider(
                thickness: 1,
                color: Color(0x1A000000),
              ),
              const SizedBox(height: 12,),

              InkWell(
                onTap: (){
                  Get.toNamed(MyRouters.currencyConvert);


                },
                child: Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Check Rates",
                          style: GoogleFonts.poppins(
                              color: const Color(0xFF1D1D1D),
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "See current foreign exchange rates",
                          style: GoogleFonts.poppins(
                              color: const Color(0xFF1D1D1D),
                              fontSize: 11,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    const Spacer(),

                    const Icon(Icons.arrow_forward_ios, size: 15,),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12,),
              const Divider(
                thickness: 5,
                color: Color(0x1A000000),
              ),
              const SizedBox(height: 12,),
              // InkWell(
              //   onTap: () {
              //     Get.toNamed(MyRouters.buyServices);
              //   },
              //   child: Row(
              //     children: [
              //       const SizedBox(
              //         width: 20,
              //       ),
              //       Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text(
              //             "Buy Airtime",
              //             style: GoogleFonts.poppins(
              //                 color: const Color(0xFF1D1D1D),
              //                 fontSize: 13,
              //                 fontWeight: FontWeight.w400),
              //           ),
              //           Text(
              //             "Buy discounted airtime with your ZIP balance",
              //             style: GoogleFonts.poppins(
              //                 color: const Color(0xFF1D1D1D),
              //                 fontSize: 9,
              //                 fontWeight: FontWeight.w300),
              //           ),
              //         ],
              //       ),
              //       const Spacer(),
              //
              //       Text(
              //         "2% OFF",
              //         style: GoogleFonts.poppins(
              //             color: const Color(0xFF0FA657),
              //             fontSize: 13,
              //             fontWeight: FontWeight.w500),
              //       ),
              //
              //       const Icon(Icons.arrow_forward_ios, size: 15,),
              //       const SizedBox(
              //         width: 20,
              //       ),
              //     ],
              //   ),
              // ),
              // const SizedBox(height: 12,),
              // const Divider(
              //   thickness: 1,
              //   color: Color(0x1A000000),
              // ),
              // const SizedBox(height: 12,),
              // InkWell(
              //   onTap: () {
              //     Get.toNamed(MyRouters.payBillsServices);
              //   },
              //   child: Row(
              //     children: [
              //       const SizedBox(
              //         width: 20,
              //       ),
              //       Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text(
              //             "Pay Bills",
              //             style: GoogleFonts.poppins(
              //                 color: const Color(0xFF1D1D1D),
              //                 fontSize: 13,
              //                 fontWeight: FontWeight.w400),
              //           ),
              //           Text(
              //             "Pay your bills with your ZIP balance",
              //             style: GoogleFonts.poppins(
              //                 color: const Color(0xFF1D1D1D),
              //                 fontSize: 9,
              //                 fontWeight: FontWeight.w300),
              //           ),
              //         ],
              //       ),
              //       const Spacer(),
              //
              //       const Icon(Icons.arrow_forward_ios, size: 15,),
              //       const SizedBox(
              //         width: 20,
              //       ),
              //     ],
              //   ),
              // ),
              // const SizedBox(height: 12,),
              // const Divider(
              //   thickness: 1,
              //   color: Color(0x1A000000),
              // ),
              // const SizedBox(height: 12,),
              InkWell(
                onTap: (){
                  Get.toNamed(MyRouters.buyAirtimeList);
                },
                child: Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Connected Merchants",
                          style: GoogleFonts.poppins(
                              color: const Color(0xFF1D1D1D),
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "See current foreign exchange rates",
                          style: GoogleFonts.poppins(
                              color: const Color(0xFF1D1D1D),
                              fontSize: 11,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    const Spacer(),

                    const Icon(Icons.arrow_forward_ios, size: 15,),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12,),

              const Divider(
                thickness: 1,
                color: Color(0x1A000000),
              ),
              const SizedBox(height: 12,),
              InkWell(
                onTap: (){
                  Get.toNamed(MyRouters.yourRecipient);
                },
                child: Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Recipients ",
                          style: GoogleFonts.poppins(
                              color: const Color(0xFF1D1D1D),
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "Sign into your account using multiple  phone numbers \n and emails",
                          style: GoogleFonts.poppins(
                              color: const Color(0xFF1D1D1D),
                              fontSize: 11,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    const Spacer(),

                    const Icon(Icons.arrow_forward_ios, size: 15,),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12,),
              const Divider(
                thickness: 5,
                color: Color(0x1A000000),
              ),
              const SizedBox(height: 12,),

              // Row(
              //   children: [
              //     const SizedBox(
              //       width: 20,
              //     ),
              //     Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Text(
              //           "Payment Methods",
              //           style: GoogleFonts.poppins(
              //               color: const Color(0xFF1D1D1D),
              //               fontSize: 13,
              //               fontWeight: FontWeight.w400),
              //         ),
              //         Text(
              //           "Add multiple card and bank accounts",
              //           style: GoogleFonts.poppins(
              //               color: const Color(0xFF1D1D1D),
              //               fontSize: 9,
              //               fontWeight: FontWeight.w300),
              //         ),
              //       ],
              //     ),
              //     const Spacer(),
              //
              //     const Icon(Icons.arrow_forward_ios, size: 15,),
              //     const SizedBox(
              //       width: 20,
              //     ),
              //   ],
              // ),
              // const SizedBox(height: 12,),
              // const Divider(
              //   thickness: 1,
              //   color: Color(0x1A000000),
              // ),
              const SizedBox(height: 12,),
              // InkWell(
              //   onTap: () {
              //     Get.toNamed(MyRouters.limitScreen);
              //   },
              //   child: Row(
              //     children: [
              //       const SizedBox(
              //         width: 20,
              //       ),
              //       Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text(
              //             "Transfer Limits",
              //             style: GoogleFonts.poppins(
              //                 color: const Color(0xFF1D1D1D),
              //                 fontSize: 15,
              //                 fontWeight: FontWeight.w600),
              //           ),
              //           Text(
              //             "Check Money transfer limits",
              //             style: GoogleFonts.poppins(
              //                 color: const Color(0xFF1D1D1D),
              //                 fontSize: 11,
              //                 fontWeight: FontWeight.w400),
              //           ),
              //         ],
              //       ),
              //       const Spacer(),
              //
              //       const Icon(Icons.arrow_forward_ios, size: 15,),
              //       const SizedBox(
              //         width: 20,
              //       ),
              //     ],
              //   ),
              // ),
              // const SizedBox(height: 12,),
              // const Divider(
              //   thickness: 1,
              //   color: Color(0x1A000000),
              // ),
              const SizedBox(height: 12,),
              InkWell(
                onTap: () {
                  Get.toNamed(MyRouters.setting);
                },
                child: Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Settings",
                          style: GoogleFonts.poppins(
                              color: const Color(0xFF1D1D1D),
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "Control your notification and security settings",
                          style: GoogleFonts.poppins(
                              color: const Color(0xFF1D1D1D),
                              fontSize: 11,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    const Spacer(),

                    const Icon(Icons.arrow_forward_ios, size: 15,),
                    const SizedBox(
                      width: 30,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 130,)
            ],
          ),
        );
        } else {
          return const Center(child: CircularProgressIndicator(),);
        }
      }),
    );
  }
}
