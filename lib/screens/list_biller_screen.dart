import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/routers/my_routers.dart';

import '../controller/update_user.dart';
import '../models/buy_electricity_model.dart';
import '../models/mode_biller.dart';
import '../models/model_fetch_telcos.dart';
import '../repository/buy_electricity_repo.dart';
import '../repository/fetch_telcos_repo.dart';
import '../repository/list_biller_repo.dart';
import '../widgets/circular_progressindicator.dart';
import '../widgets/common_button.dart';
import '../widgets/common_colour.dart';
import '../widgets/common_error_widget.dart';
class BillerScreen extends StatefulWidget {
  const BillerScreen({Key? key}) : super(key: key);

  @override
  State<BillerScreen> createState() => _BillerScreenState();
}

class _BillerScreenState extends State<BillerScreen> {

  Rx<RxStatus> statusOfBiller= RxStatus.empty().obs;
  Rx<BuyElectricityModel> biller = BuyElectricityModel().obs;
  final controller = Get.put(registerController());
  getBillerList() {
    commonElectricityRepo(
identifier: "electricity-bill",
      key: "services"
    ).then((value) {
      log("response.body.....    ${value}");
      biller.value = value;
      if (value.status == true) {
        statusOfBiller.value = RxStatus.success();
      } else {
        statusOfBiller.value = RxStatus.error();
      }
    }
      // showToast(value.message.toString());
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBillerList();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_rounded,
              color: AppTheme.primaryColor,
            ),
          ),
          title: Text(
            "Energy",
            style: GoogleFonts.poppins(
                color: const Color(0xFF1D1D1D),
                fontSize: 20,
                fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(() {
                        return  statusOfBiller.value.isSuccess ?
                        ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount:biller.value.data!.content!.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        ClipOval(
                                          child: CachedNetworkImage(
                                            width: 40,
                                            height: 40,
                                            fit: BoxFit.cover,
                                            imageUrl: biller.value.data!.content![index].image.toString(),
                                            placeholder: (context, url) =>
                                            const SizedBox(),
                                            errorWidget: (context, url, error) =>
                                            const SizedBox(),
                                          ),
                                        ),
                                        Expanded(
                                          child: InkWell(
                                            onTap: () {
                                            controller.provider.text = biller.value.data!.content![index].name.toString();
                                              // controller.idController1.text = chooseBank.value.data![index].code.toString();
                                              Get.toNamed(MyRouters.electricityVariationScreen,
                                                  arguments: [biller.value.data!.content![index].serviceID.toString(),]);
                                            },
                                            child: Text(biller.value.data!.content![index].name.toString(),
                                              style: GoogleFonts.poppins(
                                                  color: const Color(0xFF1D1D1D),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),),
                                          ),
                                        ),

                                        // InkWell(
                                        //     onTap: (){
                                        //       // Get.toNamed(MyRouters.dataPlanScreen,arguments: [biller.value.data![index].name.toString(),]);
                                        //     },
                                        //     child: Container(
                                        //         padding: EdgeInsets.symmetric(vertical: 8,horizontal: 10),
                                        //         decoration: BoxDecoration(
                                        //           borderRadius: BorderRadius.circular(7),
                                        //           color: AppTheme.secondaryColor,
                                        //         ),
                                        //
                                        //         child: Text("See Plan",
                                        //           style: GoogleFonts.poppins(
                                        //               color:  Colors.white,
                                        //               fontSize: 12,
                                        //               fontWeight: FontWeight.w500),))),
                                      ],
                                    )



                                  ],
                                ),
                              );
                            }):  statusOfBiller.value.isError
                            ? CommonErrorWidget(
                          errorText:
                          biller.value.message.toString(),
                          onTap: () {
                            getBillerList();
                          },
                        )
                            : const CommonProgressIndicator();
                      })

                    ]
                ))));
  }
}
