import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/routers/my_routers.dart';

import '../controller/profile_controller.dart';
import '../controller/update_user.dart';
import '../models/airtime_country_model.dart';
import '../models/mode_biller.dart';
import '../models/model_fetch_telcos.dart';
import '../models/service_common_model.dart';
import '../repository/airtime_country_repo.dart';
import '../repository/fetch_telcos_repo.dart';
import '../repository/list_biller_repo.dart';
import '../repository/service_common_repo.dart';
import '../widgets/circular_progressindicator.dart';
import '../widgets/common_button.dart';
import '../widgets/common_colour.dart';
import '../widgets/common_error_widget.dart';
class BuyAirtimeCountryScreen extends StatefulWidget {
  const BuyAirtimeCountryScreen({Key? key}) : super(key: key);

  @override
  State<BuyAirtimeCountryScreen> createState() => _BuyAirtimeCountryScreenState();
}

class _BuyAirtimeCountryScreenState extends State<BuyAirtimeCountryScreen> {

  Rx<RxStatus> statusOftelcos= RxStatus.empty().obs;
  Rx<AirtimeCountryModel> telcos = AirtimeCountryModel().obs;
  final profileController = Get.put(ProfileController());
  var service = Get.arguments[0];
  // getTelcoList() {
  //   commonServiceRepo(
  //       key: "services"
  //   ).then((value) {
  //     log("response.body.....    ${value}");
  //     telcos.value = value;
  //
  //     statusOftelcos.value = RxStatus.success();
  //   }
  //     // showToast(value.message.toString());
  //   );
  // }
  getTelcoList() {
    commonCountryRepo(
        key: "airtime-countries",

    ).then((value) {
      log("response.body.....    ${value}");
      telcos.value = value;
      if (value.status == true) {
        statusOftelcos.value = RxStatus.success();
      } else {
        statusOftelcos.value = RxStatus.error();
      }
    }
      // showToast(value.message.toString());
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTelcoList();
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
            "AirTime",
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
                        return  statusOftelcos.value.isSuccess ?
                        ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount:telcos.value.data!.content!.countries!.length,
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
                                            imageUrl: telcos.value.data!.content!.countries![index].flag.toString(),
                                            placeholder: (context, url) =>
                                            const SizedBox(),
                                            errorWidget: (context, url, error) =>
                                            const SizedBox(),
                                          ),
                                        ),
                                        SizedBox(width: 20,),
                                        Expanded(
                                          child: InkWell(
                                            onTap: () {
                                              profileController.airtimeController.text = telcos.value.data!.content!.countries![index].name.toString();
                                              // controller.idController1.text = chooseBank.value.data![index].code.toString();
                                              Get.toNamed(MyRouters.buyAirtimeProductScreen,
                                                  arguments: [telcos.value.data!.content!.countries![index].code.toString(),service]);
                                            },
                                            child: Text(telcos.value.data!.content!.countries![index].name.toString(),
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
                            }):  statusOftelcos.value.isError
                            ? CommonErrorWidget(
                          errorText:
                          "",
                          onTap: () {
                            getTelcoList();
                          },
                        )
                            : const CommonProgressIndicator();
                      })

                    ]
                ))));
  }
}
