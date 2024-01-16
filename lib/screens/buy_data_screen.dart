import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zip/routers/my_routers.dart';

import '../controller/profile_controller.dart';
import '../models/service_common_model.dart';
import '../repository/service_common_repo.dart';
import '../widgets/circular_progressindicator.dart';
import '../widgets/common_button.dart';
import '../widgets/common_colour.dart';
import '../widgets/common_error_widget.dart';

class BuyDataScreen extends StatefulWidget {
  const BuyDataScreen({Key? key}) : super(key: key);

  @override
  State<BuyDataScreen> createState() => _BuyDataScreenState();
}

class _BuyDataScreenState extends State<BuyDataScreen> {
  Rx<RxStatus> statusOftelcos = RxStatus.empty().obs;
  Rx<ServiceCommonModel> telcos = ServiceCommonModel().obs;
  final profileController = Get.put(ProfileController());

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
    commonServiceRepo(key: "services", identifier: "data").then((value) {
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
            "Data Plan",
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
                        return statusOftelcos.value.isSuccess
                            ? ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: telcos.value.data!.content!.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            ClipOval(
                                              child: CachedNetworkImage(
                                                width: 40,
                                                height: 40,
                                                fit: BoxFit.cover,
                                                imageUrl: telcos.value.data!
                                                    .content![index].image
                                                    .toString(),
                                                placeholder: (context, url) =>
                                                    const SizedBox(),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        const SizedBox(),
                                              ),
                                            ),
                                            Text(
                                              telcos.value.data!.content![index]
                                                  .name
                                                  .toString(),
                                              style: GoogleFonts.poppins(
                                                  color:
                                                      const Color(0xFF1D1D1D),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            InkWell(
                                                onTap: () {
                                                  Get.toNamed(
                                                      MyRouters
                                                          .interNetPlanScreen,
                                                      arguments: [
                                                        // telcos.value.data!.content![index].name.toString(),
                                                        telcos
                                                            .value
                                                            .data!
                                                            .content![index]
                                                            .serviceID
                                                            .toString(),
                                                      ]);
                                                },
                                                child: Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 8,
                                                            horizontal: 10),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              7),
                                                      color: AppTheme
                                                          .secondaryColor,
                                                    ),
                                                    child: Text(
                                                      "See Plan",
                                                      style:
                                                          GoogleFonts.poppins(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                    ))),
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                                })
                            : statusOftelcos.value.isError
                                ? CommonErrorWidget(
                                    errorText: telcos.value.message.toString(),
                                    onTap: () {
                                      getTelcoList();
                                    },
                                  )
                                : const CommonProgressIndicator();
                      })
                    ]))));
  }
}
