import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/routers/my_routers.dart';
import 'package:zip/widgets/common_button.dart';
import 'package:zip/widgets/common_textfield.dart';

import '../../models/model_choose_bank.dart';
import '../../repository/choose_bank_repo.dart';
import '../../resourses/api_constant.dart';
import '../../widgets/common_error_widget.dart';

class ChooseBank extends StatefulWidget {
  const ChooseBank({Key? key}) : super(key: key);

  @override
  State<ChooseBank> createState() => _ChooseBankState();
}

class _ChooseBankState extends State<ChooseBank> {


  Rx<RxStatus> statusOfChooseBank = RxStatus
      .empty()
      .obs;

  Rx<ChooseBankList> chooseBank = ChooseBankList().obs;


  ChooseBankApi() {
    chooseBankRepo("/${"NG"}",).then((value) {
      chooseBank.value = value;

      if (value.status == true) {
        statusOfChooseBank.value = RxStatus.success();
      } else {
        statusOfChooseBank.value = RxStatus.error();
      }

      showToast(value.message.toString());
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     ChooseBankApi();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,


          leading: InkWell(

            onTap: () {
              Get.back();
            },

            child: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.black,
              // color: AppTheme.primaryColor,
            ),
          ),
          centerTitle: true,
          title: Text(
            "Choose Bank",
            style: GoogleFonts.poppins(
                color: const Color(0xFF1D1D1D),
                fontSize: 20,
                fontWeight: FontWeight.w500),
          ),


        ),

        body: SingleChildScrollView(
            child:
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children
                          :
                      [
                        CommonTextfield(obSecure: false,
                          hintText: "Search for a bank",
                          prefix: Padding(
                            padding: const EdgeInsets.all(13.0),
                            child: SvgPicture.asset(
                              "assets/images/Search.svg", width: 10,),
                          ),),
                        SizedBox(height: 20,),


                        Obx(() {
                          return chooseBank.value.status=="success"
                              ?

                          ListView.builder(

                              itemCount: chooseBank.value.data!.length,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(

                                      mainAxisAlignment: MainAxisAlignment
                                          .start,
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Get.toNamed(MyRouters.sendCash2);
                                          
                                          },
                                          child: Text(
                                            chooseBank.value.data![index].name
                                                .toString(),
                                            style: GoogleFonts.poppins(
                                                color: const Color(0xFF1D1D1D),
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),),
                                        ),
                                        SizedBox(height: 2,),
                                      ],
                                    ),
                                  );
                              }) : statusOfChooseBank.value.isError
                              ? CommonErrorWidget(
                            errorText: chooseBank.value.message
                                .toString(),
                            onTap: () {},
                          )
                              : Center(child: CircularProgressIndicator());
                        })
                      ]
                  ))
            ));
  }
}
