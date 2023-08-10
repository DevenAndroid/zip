import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_boder_button.dart';
import 'package:zip/widgets/common_button.dart';
import 'package:zip/widgets/common_colour.dart';

import '../../controller/profile_controller.dart';
import '../../repository/myprofile_repo.dart';

    class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
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
    Size size = MediaQuery.of(context).size;
    return  Scaffold(
      body:
      Obx(() {
      return profileController.modal.value.status==true?
      SingleChildScrollView(
        child: Padding(
          padding:  const EdgeInsets.symmetric(
              horizontal: 15, vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(
                'Hi,👋🏻'+'${profileController.modal.value.data!.user!.fname.toString()} ' + ' ${profileController.modal.value.data!.user!.lname.toString()}',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),

              Text(
                'Welcome to ZIP',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(fontSize: 18,),
                ),
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: (){
                      Get.toNamed(MyRouters.accountsInBank);
                    },
                    child: Container(

                      width: size.width*.47,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            colors: [

                              Color(0xFFF0D75F),
                              Color(0xFFB2802A),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(

                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 5,),
                          InkWell(
                            onTap: (){
                              Get.toNamed(MyRouters.accountsInBank);
                            },
                            child: Text("Current Balance",
                              style: GoogleFonts.poppins(
                                  color: const Color(0xFF2E2E2E),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),),
                          ),
                          const SizedBox(height: 5,),
                          InkWell(
                            onTap: (){
                              Get.toNamed(MyRouters.accountsInBank);
                            },
                            child: Text("\$276.00",
                              style: GoogleFonts.poppins(
                                  color:  Colors.white,
                                  fontSize: 35,
                                  fontWeight: FontWeight.w500),),
                          ),
             const SizedBox(height: 110,),
                      InkWell(
                        onTap: (){
                          Get.toNamed(MyRouters.accountsInBank);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset('assets/images/swap.svg',),
                            const Icon(Icons.arrow_forward_rounded,size: 25,)
                          ],
                        ),
                      )

                        ],
                      ),
                    ),

                    ),
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: (){
                          Get.toNamed(MyRouters.addRecipientsStart);
                        },
                        child: Container(

                          width: size.width*.39,
                          decoration: BoxDecoration(


                                 color: const Color(0xFF1D1D1D),


                            borderRadius: BorderRadius.circular(15),
                          ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(

                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(Icons.arrow_downward,color: Colors.white,),
                              const SizedBox(height: 50,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "Add Cash",
                                    style: GoogleFonts.poppins(
                                        color:  Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500),),
                                ],
                              ),

                            ],
                          ),
                        ),

                        ),
                      ),
                      const SizedBox(height: 8,),
                      InkWell(
                        onTap: (){
                          Get.toNamed(MyRouters.sendCashYourBalance);
                        },
                        child: Container(

                          width: size.width*.39,
                          decoration: BoxDecoration(
                            color: const Color(0xFF1D1D1D),

                            borderRadius: BorderRadius.circular(15),
                          ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(


                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                            SvgPicture.asset("assets/images/arrow.svg"),
                              const SizedBox(height: 50,),
                              Text("Cash Out",
                                style: GoogleFonts.poppins(
                                    color:  Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500),),



                            ],
                          ),
                        ),

                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              Text(
                'My ZIP',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Color(0xFF2E2E2E)),
                ),
              ),
              Text(
                'Quis ut dolorum architecto dolorem ipsum.',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xFF1D1D1D)),
                ),
              ),
const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: (){
                  Get.toNamed(MyRouters.loanScreen);
                },
                child: Container(
padding: const EdgeInsets.all(8),

                  decoration: BoxDecoration(
                      color: const Color(0xFFFAFAFA),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color:   Colors.black26,
                          offset: Offset(
                            0.5,
                            0.5,
                          ), //Offset
                          blurRadius:    0.5,
                          spreadRadius: 0.0,
                        ), //BoxShadow
                      ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
Row(
  mainAxisAlignment: MainAxisAlignment.end,
  crossAxisAlignment: CrossAxisAlignment.end,
  children: const [
    SizedBox(width: 60,),
    Icon(Icons.arrow_forward,size: 20,),

  ],
),
                    SvgPicture.asset("assets/images/banktransfer.svg",width: 50,),
                    const SizedBox(height: 8,),
                    Text(
                      'Loans\n',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Color(0xFF2E2E2E)),
                      ),
                    ),
                  ],
                ),
                ),
              ),
              InkWell(
                onTap: (){
                  Get.toNamed(MyRouters.supportScreen);
                },
                child: Container(
padding: const EdgeInsets.all(8),

                  decoration: BoxDecoration(
                      color: const Color(0xFFFAFAFA),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color:   Colors.black26,
                          offset: Offset(
                            0.5,
                            0.5,
                          ), //Offset
                          blurRadius:    0.5,
                          spreadRadius: 0.0,
                        ), //BoxShadow
                      ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
Row(
  mainAxisAlignment: MainAxisAlignment.end,
  crossAxisAlignment: CrossAxisAlignment.end,
  children: const [
    SizedBox(width: 60,),
    Icon(Icons.arrow_forward,size: 20,),

  ],
),
                    SvgPicture.asset("assets/images/coustmersupport.svg",width: 50,),
                    const SizedBox(height: 8,),
                    Text(
                      'Customer\nSupport',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Color(0xFF2E2E2E)),
                      ),
                    ),
                  ],
                ),
                ),
              ),
              InkWell(
                onTap: (){
                  Get.toNamed(MyRouters.telcosScreen);
                },
                child: Container(
padding: const EdgeInsets.all(8),

                  decoration: BoxDecoration(
                      color: const Color(0xFFFAFAFA),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color:   Colors.black26,
                          offset: Offset(
                            0.5,
                            0.5,
                          ), //Offset
                          blurRadius:    0.5,
                          spreadRadius: 0.0,
                        ), //BoxShadow
                      ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
Row(
  mainAxisAlignment: MainAxisAlignment.end,
  crossAxisAlignment: CrossAxisAlignment.end,
  children: const [
    SizedBox(width: 60,),
    Icon(Icons.arrow_forward,size: 20,),

  ],
),
                    SvgPicture.asset("assets/images/i3.svg",width: 50,height: 50,),
                    const SizedBox(height: 8,),
                    Text(
                      'Buy\nAnytime',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Color(0xFF2E2E2E)),
                      ),
                    ),
                  ],
                ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: (){
                  Get.toNamed(MyRouters.meterVerifyScreen);
                },
                child: Container(
padding: const EdgeInsets.all(8),

                  decoration: BoxDecoration(
                      color: const Color(0xFFFAFAFA),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color:   Colors.black26,
                          offset: Offset(
                            0.5,
                            0.5,
                          ), //Offset
                          blurRadius:    0.5,
                          spreadRadius: 0.0,
                        ), //BoxShadow
                      ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
Row(
  mainAxisAlignment: MainAxisAlignment.end,
  crossAxisAlignment: CrossAxisAlignment.end,
  children: const [
    SizedBox(width: 60,),
    Icon(Icons.arrow_forward,size: 20,),

  ],
),
                    SvgPicture.asset("assets/images/i4.svg",width: 50,),
                    const SizedBox(height: 8,),
                    Text(
                      'Buyn\nElectricity',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Color(0xFF2E2E2E)),
                      ),
                    ),
                  ],
                ),
                ),
              ),
              InkWell(
                onTap: (){
                  Get.toNamed(MyRouters.cabelTvScreen);
                },
                child: Container(
padding: const EdgeInsets.all(8),

                  decoration: BoxDecoration(
                      color: const Color(0xFFFAFAFA),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color:   Colors.black26,
                          offset: Offset(
                            0.5,
                            0.5,
                          ), //Offset
                          blurRadius:    0.5,
                          spreadRadius: 0.0,
                        ), //BoxShadow
                      ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
Row(
  mainAxisAlignment: MainAxisAlignment.end,
  crossAxisAlignment: CrossAxisAlignment.end,
  children: const [
    SizedBox(width: 60,),
    Icon(Icons.arrow_forward,size: 20,),

  ],
),
                    SvgPicture.asset("assets/images/i5.svg",width: 50,),
                    const SizedBox(height: 8,),
                    Text(
                      'Buy \nCabelTv',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Color(0xFF2E2E2E)),
                      ),
                    ),
                  ],
                ),
                ),
              ),
              Container(
padding: const EdgeInsets.all(8),

                decoration: BoxDecoration(
                    color: const Color(0xFFFAFAFA),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color:   Colors.black26,
                        offset: Offset(
                          0.5,
                          0.5,
                        ), //Offset
                        blurRadius:    0.5,
                        spreadRadius: 0.0,
                      ), //BoxShadow
                    ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
Row(
  mainAxisAlignment: MainAxisAlignment.end,
  crossAxisAlignment: CrossAxisAlignment.end,
  children: const [
    SizedBox(width: 60,),
    Icon(Icons.arrow_forward,size: 20,),

  ],
),
                  SvgPicture.asset("assets/images/i6.svg",width: 50,height: 50,),
                  const SizedBox(height: 8,),
                  Text(
                    'Pay\nBills',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Color(0xFF2E2E2E)),
                    ),
                  ),
                ],
              ),
              ),
            ],
          ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){
                      Get.toNamed(MyRouters.buyDataScreen);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),

                      decoration: BoxDecoration(
                          color: const Color(0xFFFAFAFA),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color:   Colors.black26,
                              offset: Offset(
                                0.5,
                                0.5,
                              ), //Offset
                              blurRadius:    0.5,
                              spreadRadius: 0.0,
                            ), //BoxShadow
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const [
                              SizedBox(width: 60,),
                              Icon(Icons.arrow_forward,size: 20,),

                            ],
                          ),
                          SvgPicture.asset("assets/images/i5.svg",width: 50,),
                          const SizedBox(height: 8,),
                          Text(
                            'Buy Internet\n Data',
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Color(0xFF2E2E2E)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
const SizedBox(height: 20,),
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Check Rates',
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Color(0xFF1D1D1D)),
            ),
          ),
          Text(
            'See current foreign exchange rates',
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(fontSize: 13,fontWeight: FontWeight.w400,color: Color(0xFF1D1D1D)),
            ),
          ),
        ],
    ),

    const Icon(Icons.arrow_forward_ios,size: 20,)
  ],
),
              const SizedBox(height: 30,),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                        onTap: () {
Get.toNamed(MyRouters.requestMoney1);
                        },
                        child: const CustomOutlineButton(
                          title: "Request",
                        )),
                  ),

                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                      child: InkWell(
                        onTap: (){
                        Get.toNamed(MyRouters.sendCashReciptant);
                        // Get.toNamed(MyRouters.sendCash1);
                        },
                        child: CustomOutlineBoder(
                          title: "Send",
                          backgroundColor: Colors.white,
                          textColor: AppTheme.buttonColor,onPressed: (){
                          Get.toNamed(MyRouters.mobileNumber);
                        },),
                      )),
                ],
              ),
          SizedBox(height: size.height*.1,)
            ],
          ),
        ),
      ):Center(child: CircularProgressIndicator(),);
      }),
    );
  }
}
